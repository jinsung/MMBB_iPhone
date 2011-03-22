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
- (BOOL) updateBookmarkUnitWithID: (NSInteger) unitId isBookmark: (NSInteger) bookmark;
- (NSMutableArray *) getQuestionInChapter: (NSInteger) chapterID withType: (NSInteger) typeID;
- (BOOL) resetQuestionsInChapter: (NSInteger) chapterID withType: (NSInteger) typeID;
- (BOOL) updateUserAnswer: (NSInteger) answer forQuestionID:(NSInteger) questionID;
- (BOOL) updateUserSolved: (NSInteger) isSolved inChater: (NSInteger) chapterID withType: (NSInteger) typeID;
@end
