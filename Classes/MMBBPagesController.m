//
//  MMBBPagesController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MMBBPagesController.h"

@implementation MMBBPagesController

@synthesize pageDataArray, scrollView, pageControl, viewControllers, pageNumberBuffer;

- (void)viewDidLoad {
	[super viewDidLoad];
	// view controllers are created lazily
	// in the meantime, load the array with placeholders which will be replaced on demand
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	for (unsigned i = 0; i < [pageDataArray count] + 1; i++)
	{
		[controllers addObject:[NSNull null]];
	}
	self.viewControllers = controllers;
	[controllers release];
	
	// a page is the width of the scroll view
	self.scrollView.pagingEnabled = YES;
	self.scrollView.showsHorizontalScrollIndicator = NO;
	self.scrollView.showsVerticalScrollIndicator = NO;
	self.scrollView.scrollsToTop = NO;
	self.scrollView.delegate = self;
	self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * ([pageDataArray count]+1), 
											 self.scrollView.frame.size.height);
	
	self.pageControl.numberOfPages = [pageDataArray count] + 1;
	self.pageControl.currentPage = 0;
	//	[pageControl updateCurrentPageDisplay];
    
	// pages are created on demand
	// load the visible page
	// load the page on either side to avoid flashes when the user starts scrolling
	[self loadScrollViewWithPage:0];
	[self loadScrollViewWithPage:1];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)addControllerOnScroller:(UIViewController *)controller withPageNumber:(int) page {
	// add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = self.scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [self.scrollView addSubview:controller.view];
    }
	CGSize size = scrollView.contentSize;
	size.height = CGRectGetHeight(scrollView.frame)-1;
	scrollView.contentSize = size;
	scrollView.alwaysBounceVertical=NO;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
	if (pageNumberBuffer != self.pageControl.currentPage) {
		[self continueChangePage:page];
		pageNumberBuffer = page;
	}
	  
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (void)loadScrollViewWithPage:(int)page {
	// do nothing.
}

- (void)continueChangePage:(NSInteger) page {
	// do nothing.
}

- (void)dealloc {
	[viewControllers release];
    [scrollView release];
    [pageControl release];
	[pageDataArray release];
    [super dealloc];
}

@end
