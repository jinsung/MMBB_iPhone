//
//  SQLAccess.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SQLAccess.h"
#import "SectionItem.h"
#import "UnitItem.h"
#import "QuestionItem.h"

@interface SQLAccess (Private)
- (NSMutableArray *) getUnitsWithSQL: (NSString *) sql;
- (UnitItem *) getUnitItem: (FMResultSet *) rs;
- (ChapterItem *) getChapterItem: (FMResultSet *) rs;
- (QuestionItem *) getQuestionItem: (FMResultSet *) rs;
- (QuestionGroupItem *) getQuestionGroupItem: (FMResultSet *) rs;
@end


@implementation SQLAccess

static NSString *kSectionTableName = @"Section";
static NSString *kChapterTableName = @"Chapter";
static NSString *kUnitTableName = @"Unit";
static NSString *kQuestionTableName = @"Question";
static NSString *kQuestionGroupTableName = @"QuestionGroup";

@synthesize db;

-(id)init
{
	self = [super init];
	if (!self)
		return nil;
	
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
														 NSUserDomainMask, YES);
	NSString *path = [paths objectAtIndex:0];
	NSString *fullPath = [path stringByAppendingPathComponent:@"mmbb.db"];
	NSFileManager *fm = [NSFileManager defaultManager];
	BOOL exists = [fm fileExistsAtPath:fullPath];
	
	if (exists) {
		NSLog(@"%@ exists -- just opening", fullPath);
	} else {
		NSLog(@"%@ does not exist -- copying and opening", fullPath);
		
		// Where is the starting database in the app wrapper?
		NSString *pathForStartingDB = [[NSBundle mainBundle] pathForResource:@"mmbb"
																	  ofType:@"db"];
		
		// Copy it to the documents directory
		BOOL success = [fm copyItemAtPath:pathForStartingDB 
								   toPath:fullPath error:NULL];
		if (!success) {
			NSLog(@"database copy failed");
		}
	}
	
	// Open the database file
	db = [[FMDatabase alloc] initWithPath:fullPath];
	if (![db open]) {
		NSLog(@"Can't open database path with FMDatabase %@", fullPath);
		return nil;
	}
	return self;
}

/*
- (NSMutableArray *) getSections {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@", 
					 kSectionTableName];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		SectionItem *si = [[[SectionItem alloc] init] autorelease];
		[si setTitle:[rs stringForColumn:@"title"]];
		
		NSInteger currentSectionID = [rs intForColumn:@"id"];
		NSString *secSql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE section_id=%d", 
							kChapterTableName, currentSectionID];
		FMResultSet *secRs = [db executeQuery:secSql];
		NSMutableArray *chapters = [[NSMutableArray alloc] init];
		while ([secRs next]) {
			ChapterItem *chapter = [[ChapterItem alloc] init];
			[chapter setTitle:[secRs stringForColumn:@"title"]];
			[chapter setId:[secRs intForColumn:@"id"]];
			[chapters addObject:chapter];
			[chapter release], chapter=nil;
		}
		[si setChapters:chapters];
		[chapters release], chapters=nil;
		[a addObject:si];
	}
	return [a autorelease];
}
*/

- (NSMutableArray *) getChapters {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@", 
					 kChapterTableName];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
        ChapterItem *chapter = [self getChapterItem: rs];
		[a addObject:chapter];
	}	
	return [a autorelease];
}

- (NSMutableArray *) getUnitsInChapterID: (NSInteger)chapterID {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE chapter_id=%d",
					 kUnitTableName, chapterID];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		[a addObject:[self getUnitItem:rs]];
	}
	return [a autorelease];
}

- (NSMutableArray *) getUnitsInOrder {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSArray *ganadaArray = [NSArray arrayWithObjects:@"ㄱ", @"ㄴ", @"ㄷ", @"ㄹ", @"ㅁ", @"ㅂ", @"ㅅ", 
								@"ㅇ", @"ㅈ", @"ㅊ", @"ㅋ", @"ㅌ", @"ㅍ", @"ㅎ", nil];
	for (int i=0; i<ganadaArray.count; i++) {
		NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE alphabet_order=%d ORDER BY title ASC", kUnitTableName, i];
		NSMutableArray *sa = [self getUnitsWithSQL: sql];
		if( sa.count > 0 ) {
			ChapterItem *chapter = [[ChapterItem alloc] init];
			[chapter setId:i];
			[chapter setTitle:[ganadaArray objectAtIndex:i]];
			[chapter setUnits:sa];
			[a addObject:chapter];
			[chapter release];
		}
	}
	
	return [a autorelease];
}

- (UnitItem *) getUnitItemByID: (NSInteger) unitID {
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id=%d", kUnitTableName, unitID];
	NSMutableArray *a = [self getUnitsWithSQL: sql];
	UnitItem *ui = [a objectAtIndex:0];
	return ui;
}


- (ChapterItem *) getChapterItemByID: (NSInteger) chapterID {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id=%d", kChapterTableName, chapterID];
    FMResultSet *rs = [db executeQuery:sql];
    ChapterItem *ci;
    while ([rs next]) {
        ci = [self getChapterItem: rs];
    }
    return ci;
}

- (NSMutableArray *) getUnitsWithSQL: (NSString *) sql {
	FMResultSet *rs = [db executeQuery:sql];
	NSMutableArray *sa = [[NSMutableArray alloc] init];
	while ([rs next]) {
		[sa addObject:[self getUnitItem:rs]];
	}
	return [sa autorelease];
}
              
- (ChapterItem *) getChapterItem: (FMResultSet *) rs {
    ChapterItem *chapter = [[ChapterItem alloc] init];
    [chapter setId:[rs intForColumn:@"id"]];
    [chapter setTitle:[rs stringForColumn:@"title"]];
    [chapter setUnits:[self getUnitsInChapterID:chapter.id]];
    
    NSInteger currentSectionID = [rs intForColumn:@"section_id"];
    NSString *sectionSql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id=%d", 
                            kSectionTableName, currentSectionID];
    FMResultSet *sectionRs = [db executeQuery:sectionSql];
    while ([sectionRs next]) {
        [chapter setSectionTitle:[sectionRs stringForColumn:@"title"]];
    }
    
    return [chapter autorelease];
}

- (UnitItem *) getUnitItem: (FMResultSet *) rs {
	UnitItem * ui = [[UnitItem alloc] init];
	[ui setTitle:[rs stringForColumn: @"title"]];
	[ui setId:[rs intForColumn: @"id"]];
	[ui setUnitNum:[rs intForColumn:@"unit_num"]];
	[ui setChapterID:[rs intForColumn: @"chapter_id"]];
	[ui setIsBookmarked:[rs intForColumn:@"is_bookmarked"]];
	[ui setUnitType:[rs intForColumn:@"unit_type"]];
    [ui setQuestionGroupID:[rs intForColumn:@"question_group_id"]];
	return [ui autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark BOOKMARK

- (BOOL) updateBookmarkUnitWithID: (NSInteger) unitId isBookmark: (NSInteger) bookmark {
	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET is_bookmarked=%d WHERE id=%d", 
					 kUnitTableName, bookmark, unitId ];
	return [db executeUpdate:sql];
}

- (NSMutableArray *) getUnitsInBookmarked {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSArray *ganadaArray = [NSArray arrayWithObjects:@"ㄱ", @"ㄴ", @"ㄷ", @"ㄹ", @"ㅁ", @"ㅂ", @"ㅅ", 
							@"ㅇ", @"ㅈ", @"ㅊ", @"ㅋ", @"ㅌ", @"ㅍ", @"ㅎ", nil];
	for (int i=0; i<ganadaArray.count; i++) {
		NSString *sql = 
		[NSString stringWithFormat:@"SELECT * FROM %@ WHERE alphabet_order=%d AND is_bookmarked=%d ORDER BY title ASC", 
		 kUnitTableName, i, 1];
		NSMutableArray *sa = [self getUnitsWithSQL: sql];
		if( sa.count > 0 ) {
			ChapterItem *chapter = [[ChapterItem alloc] init];
			[chapter setId:i];
			[chapter setTitle:[ganadaArray objectAtIndex:i]];
			[chapter setUnits:sa];
			[a addObject:chapter];
			[chapter release];
		}
	}
	return [a autorelease];
}

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark QUESTION 

- (NSMutableArray *) getQuestionGroup {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@", 
					 kQuestionGroupTableName];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		QuestionGroupItem *qg = [self getQuestionGroupItem: rs];
		[a addObject:qg];
	}	
	return [a autorelease];	
}

- (QuestionGroupItem *) getQuestionGroupItemByGroupID: (NSInteger) groupID {
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE id=%d", 
					 kQuestionGroupTableName, groupID];
	FMResultSet *rs = [db executeQuery:sql];
    QuestionGroupItem *qg;
	while ([rs next]) {
		qg = [self getQuestionGroupItem: rs];
	}
    return qg;
}

- (QuestionGroupItem *) getQuestionGroupItem: (FMResultSet *) rs {
    QuestionGroupItem *qg = [[QuestionGroupItem alloc] init];
    [qg setId:[rs intForColumn:@"id"]];
    [qg setTitle:[rs stringForColumn:@"title"]];
    return [qg autorelease];
}

- (NSMutableArray *) getQuestionInGroup: (NSInteger) groupID withType: (NSInteger) typeID{
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE group_id=%d AND type=%d",
					 kQuestionTableName, groupID, typeID];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		QuestionItem *question = [self getQuestionItem:rs];
		[a addObject:question];
	}
	return [a autorelease];
}

- (BOOL) updateUserSolved: (NSInteger) isSolved inGroup: (NSInteger) groupID withType: (NSInteger) typeID {
	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET answer_page_visited=%d WHERE group_id=%d AND type=%d",
					 kQuestionTableName, isSolved, groupID, typeID];
	return [db executeUpdate:sql];
}

- (BOOL) resetQuestionsInGroup: (NSInteger) groupID withType: (NSInteger) typeID {
	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET answer_page_visited=0, answer=0 WHERE group_id=%d AND type=%d",
					 kQuestionTableName, groupID, typeID];
	return [db executeUpdate:sql];
}

- (BOOL) updateUserAnswer: (NSInteger) answer forQuestionID:(NSInteger) questionID {
	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET answer=%d WHERE id=%d", 
					 kQuestionTableName, answer, questionID ];
	return [db executeUpdate:sql];
}

- (QuestionItem *) getQuestionItem: (FMResultSet *) rs {
	QuestionItem *question = [[QuestionItem alloc] init];
	[question setId:[rs intForColumn:@"id"]];
	[question setIndex:[rs intForColumn: @"q_index"]];
	[question setType:[rs intForColumn: @"type"]];
	[question setGroupID:[rs intForColumn: @"group_id"]];
	[question setChapterID:[rs intForColumn: @"chapter_id"]];
	[question setCorrectAnswer:[rs intForColumn:@"correct_answer"]];
	[question setUserAnswer:[rs intForColumn:@"answer"]];
	[question setAnswerPageVisited:[rs intForColumn:@"answer_page_visited"]];
	[question setAnswerDesc:[rs stringForColumn:@"answer_description"]];
	return [question autorelease];
}

- (void) dealloc {
	[db release];
	[super dealloc];
}

@end
