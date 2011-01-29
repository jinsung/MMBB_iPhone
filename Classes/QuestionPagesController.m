//
//  QuestionPagesController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "QuestionPagesController.h"
#import "QuestionViewController.h"
#import "AnswerSheetViewController.h"
#import "MMBBAppDelegate.h"

//static NSString *NameKey = @"nameKey";
//static NSString *ImageKey = @"imageKey";

@interface QuestionPagesController (Private)
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (void)continueChangePage:(NSInteger) page;
@end


@implementation QuestionPagesController

@synthesize questions, scrollView, pageControl, viewControllers, 
			aBtn1, aBtn2, aBtn3, aBtn4, aBtn5;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
				
	}
	return self;
}

//- (UIView *)view
//{
//    return self.scrollView;
//}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated {
	
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
	// view controllers are created lazily
	// in the meantime, load the array with placeholders which will be replaced on demand
	NSMutableArray *controllers = [[NSMutableArray alloc] init];
	for (unsigned i = 0; i < [questions count] + 1; i++)
	{
		[controllers addObject:[NSNull null]];
	}
	self.viewControllers = controllers;
	[controllers release];
    
	// a page is the width of the scroll view
	scrollView.pagingEnabled = YES;
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * ([questions count] + 1), scrollView.frame.size.height);
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.scrollsToTop = NO;
	scrollView.delegate = self;
    
	pageControl.numberOfPages = [questions count] + 1;
	pageControl.currentPage = 0;
//	[pageControl updateCurrentPageDisplay];
    
	// pages are created on demand
	// load the visible page
	// load the page on either side to avoid flashes when the user starts scrolling
	[self loadScrollViewWithPage:0];
	[self loadScrollViewWithPage:1];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[aBtn1 release]; 
	[aBtn2 release];
	[aBtn3 release]; 
	[aBtn4 release];
	[aBtn5 release];
	[viewControllers release];
    [scrollView release];
    [pageControl release];
	[questions release];
    [super dealloc];
}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page > [questions count]) 
		return;
		
	UIViewController *controller;
	if ( page == [questions count] ) {
		// the last page that shows the answers.
		controller = [viewControllers objectAtIndex:page];
		if ((NSNull *)controller == [NSNull null]) {
			controller = [[AnswerSheetViewController alloc] init];
			[viewControllers replaceObjectAtIndex:page withObject:controller];
			[controller release];
		}
		
	} else {
		// replace the placeholder if necessary
		controller = [viewControllers objectAtIndex:page];
		if ((NSNull *)controller == [NSNull null])
		{
			controller = [[QuestionViewController alloc] 
						  initWithNibName:@"QuestionViewController" 
						  bundle:nil ];
			((QuestionViewController *)controller).question = [questions objectAtIndex:page];
			[viewControllers replaceObjectAtIndex:page withObject:controller];
			[controller release];
		}
    }
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [scrollView addSubview:controller.view];
    }
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
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    
	[self continueChangePage:page];    
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

- (IBAction)changePage:(id)sender
{
    int page = pageControl.currentPage;
	
	[self continueChangePage:page];
	
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

- (void)continueChangePage:(NSInteger) page {
	// load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
	if (page == [questions count]) {
		AnswerSheetViewController* controller = [viewControllers objectAtIndex:page];
		[controller update:[self questions]];
	}
}

- (IBAction)answerBtnPressed:(UIButton *)sender {
	//NSLog([NSString stringWithFormat:@"anserBtnPressed - sender tag: %d", sender.tag]);
	int page = pageControl.currentPage;
	QuestionItem *currentQuestion = [questions objectAtIndex:page];
	currentQuestion.userAnswer = sender.tag;
	[[MMBBAppDelegate sql] updateUserAnswer:sender.tag forQuestionID: currentQuestion.id ];
	// answer buttons.
	NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
	for (unsigned i=0; i<[aBtns count]; i++) {
		UIButton *btn = [aBtns objectAtIndex:i];
		btn.selected = NO;
	}
	sender.selected = YES;
}


@end
