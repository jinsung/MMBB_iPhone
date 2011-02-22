//
//  MMBBPagesController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HorizontalPageScrollView.h"


@interface MMBBPagesController : UIViewController <UIScrollViewDelegate> {
	NSMutableArray *pageDataArray;
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	NSMutableArray *viewControllers;
	NSInteger pageNumberBuffer;
	// To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}

@property (nonatomic, retain) NSMutableArray *pageDataArray;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic) NSInteger pageNumberBuffer;

- (void)continueChangePage:(NSInteger) page;
- (void)loadScrollViewWithPage:(int)page;
- (void)addControllerOnScroller:(UIViewController *)controller withPageNumber:(int)page;
@end
