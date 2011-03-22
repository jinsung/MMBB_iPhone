//
//  QAMenuPageController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBPagesController.h"
#import "RespondedImageView.h"
#import "QAMenuItemViewController.h"

@interface QAMenuPageController : MMBBPagesController <QAMenuItemViewControllerDelegate> {
	NSInteger currentPageIndex;
	UISegmentedControl *segmentedControl;
	
}

@property (nonatomic) NSInteger currentPageIndex;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;
//@property (nonatomic, retain) NSMutableArray *pageData;
- (void) startQuizTouched:(QAMenuItemViewController *) sender withReset: (BOOL) isReset;

- (IBAction) segmentAction: (id) sender;
@end
