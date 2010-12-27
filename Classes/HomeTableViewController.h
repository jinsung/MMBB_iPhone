//
//  HomeViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBTableController.h"


@interface HomeTableViewController : MMBBTableController {
	NSMutableArray *filteredListContent;
	NSInteger selectedTabIndex;
	UISegmentedControl *segmentedControl;
}

@property (nonatomic) NSInteger selectedTabIndex;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic, retain) NSMutableArray *filteredListContent;

- (IBAction) segmentAction: (id) sender;

@end
