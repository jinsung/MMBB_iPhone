//
//  SQLAccess.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"
#import "UnitItem.h"
#import "ChapterItem.h"
#import "QuestionGroupItem.h"

@interface SQLAccess : NSObject {
	FMDatabase *db;
}

@property (nonatomic, retain) FMDatabase *db;

//- (NSMutableArray *) getSections; // commented out because no one use this function.
- (NSMutableArray *) getChapters;
- (NSMutableArray *) getUnitsInChapterID: (NSInteger)chapterID;
- (NSMutableArray *) getUnitsInOrder;
- (NSMutableArray *) getUnitsInBookmarked;
- (UnitItem *) getUnitItemByID: (NSInteger) unitID;
- (ChapterItem *) getChapterItemByID: (NSInteger) chapterID;
- (BOOL) updateBookmarkUnitWithID: (NSInteger) unitId isBookmark: (NSInteger) bookmark;
- (NSMutableArray *) getQuestionGroup;
- (QuestionGroupItem *) getQuestionGroupItemByGroupID: (NSInteger) groupID;
- (NSMutableArray *) getQuestionInGroup: (NSInteger) groupID withType: (NSInteger) typeID;
- (BOOL) resetQuestionsInGroup: (NSInteger) groupID withType: (NSInteger) typeID;
- (BOOL) updateUserAnswer: (NSInteger) answer forQuestionID:(NSInteger) questionID;
- (BOOL) updateUserSolved: (NSInteger) isSolved inGroup: (NSInteger) groupID withType: (NSInteger) typeID;
@end
