//
//  UnitItemsTableViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UnitItemsTableViewController : UITableViewController {
	NSMutableArray *units;
}
@property (nonatomic, retain) NSMutableArray *units;
- (id) initWithChapterID:(NSInteger)chapterID;

@end
