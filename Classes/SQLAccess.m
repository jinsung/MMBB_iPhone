//
//  SQLAccess.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SQLAccess.h"
#import "SectionItem.h"
#import "ChapterItem.h"
#import "UnitItem.h"

@interface SQLAccess (Private)
- (NSMutableArray *) getUnitsWithSQL: (NSString *) sql;
- (UnitItem *) getUnitItem: (FMResultSet *) rs;
@end


@implementation SQLAccess

static NSString *kSectionTableName = @"Section";
static NSString *kChapterTableName = @"Chapter";
static NSString *kUnitTableName = @"Unit";

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
		NSMutableArray *chapters = [[[NSMutableArray alloc] init] autorelease];
		while ([secRs next]) {
			ChapterItem *chapter = [[[ChapterItem alloc] init] autorelease];
			[chapter setTitle:[secRs stringForColumn:@"title"]];
			[chapter setId:[secRs intForColumn:@"id"]];
			[chapters addObject:chapter];
		}
		[si setChapters:chapters];
		[a addObject:si];
	}
	return [a autorelease];
}

- (NSMutableArray *) getUnitsInChapterID: (NSInteger)chapterID {
	NSMutableArray *a = [[NSMutableArray alloc] init];
	NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ WHERE chapter_id=%d",
					 kUnitTableName, chapterID];
	FMResultSet *rs = [db executeQuery:sql];
	while ([rs next]) {
		UnitItem *ui = [self getUnitItem:rs];
		[ui setId:[rs intForColumn:@"id"]];
		[ui setTitle:[rs stringForColumn: @"title"]];
		[a addObject:ui];
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
		}
	}
	
	return [a autorelease];
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

- (NSMutableArray *) getUnitsWithSQL: (NSString *) sql {
	FMResultSet *rs = [db executeQuery:sql];
	NSMutableArray *sa = [[NSMutableArray alloc] init];
	while ([rs next]) {
		UnitItem *ui = [self getUnitItem:rs];
		[sa addObject:ui];
	}
	return [sa autorelease];
}

- (UnitItem *) getUnitItem: (FMResultSet *) rs {
	UnitItem * ui = [[UnitItem alloc] init];
	[ui setTitle:[rs stringForColumn: @"title"]];
	[ui setId:[rs intForColumn: @"id"]];
	[ui setIsBookmarked:[rs intForColumn:@"is_bookmarked"]];
	return [ui autorelease];
}

- (BOOL) updateBookmarkUnitWithID: (NSInteger) unitId isBookmark: (NSInteger) bookmark {
	NSString *sql = [NSString stringWithFormat:@"UPDATE %@ SET is_bookmarked=%d WHERE id=%d", 
					 kUnitTableName, bookmark, unitId ];

	return [db executeUpdate:sql];
}

- (void) dealloc {
	[db release];
	[super dealloc];
}

@end
