//
//  QATableViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBTableController.h"


@interface QATableViewController : MMBBTableController {
	NSInteger selectedTabIndex;
	UISegmentedControl *segmentedControl;
}

@property (nonatomic) NSInteger selectedTabIndex;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction) segmentAction: (id) sender;
@end
