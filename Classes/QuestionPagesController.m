//
//  QuestionPagesController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "QuestionPagesController.h"
#import "AnswerBtnsViewController.h"
#import "AnswerSheetViewController.h"
#import "MMBBAppDelegate.h"

//static NSString *NameKey = @"nameKey";
//static NSString *ImageKey = @"imageKey";

@interface QuestionPagesController (Private)
- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (void)setQuestionsSolved: (BOOL) reset;
@end


@implementation QuestionPagesController

@synthesize chapterData, chapterInfoLable;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
	}
	return self;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
	NSString *chapterTitleText = [NSString stringWithFormat:@"%d. %@", 
								  chapterData.id, chapterData.title];
	chapterInfoLable.text = chapterTitleText;
	
	self.pageControl.numberOfPages = [pageDataArray count] + 1;
	[super viewDidLoad];
}

- (void)dealloc {
	[chapterInfoLable release];
	[chapterData release];
	[super dealloc];
}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page > [pageDataArray count]) 
		return;
		
	UIViewController *controller;
	if ( page == [pageDataArray count] ) {
		// the last page that shows the answers.
		controller = [self.viewControllers objectAtIndex:page];
		if ((NSNull *)controller == [NSNull null]) {
			controller = [[AnswerSheetViewController alloc] init];
			[self.viewControllers replaceObjectAtIndex:page withObject:controller];
			[controller release];
		}
	} else {
		// replace the placeholder if necessary
		controller = [self.viewControllers objectAtIndex:page];
		if ((NSNull *)controller == [NSNull null])
		{
			controller = [[AnswerBtnsViewController alloc] 
						  initWithNibName:@"AnswerBtnsViewController" 
						  bundle:nil ];
			((AnswerBtnsViewController *)controller).question 
				= [pageDataArray objectAtIndex:page];
			[self.viewControllers replaceObjectAtIndex:page withObject:controller];
			[controller release];
		}
    }
    [self addControllerOnScroller:controller withPageNumber:page];
}

- (IBAction)changePage:(id)sender
{
	int page = self.pageControl.currentPage;
	[self continueChangePage:page];
	pageNumberBuffer = page;
	
	// update the scroll view to the appropriate page
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

- (void)continueChangePage:(NSInteger) page {
	// load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
	
	if (page == [pageDataArray count]) {
		AnswerSheetViewController* controller = [self.viewControllers objectAtIndex:page];
		[controller update:[self pageDataArray]];
		[self setQuestionsSolved:NO];
	} else {
		AnswerBtnsViewController* controller = [self.viewControllers objectAtIndex:page];
		[controller update];
	}
}

- (void)setQuestionsSolved: (BOOL) reset {
	QuestionItem *q;
	for (int i=0; i<[self.pageDataArray count]; i++) {
		q = [self.pageDataArray objectAtIndex:i];
		if (reset)
			q.answerPageVisited = NO;
		else 
			q.answerPageVisited = YES;
	}
	NSInteger solved = !reset;
	[[MMBBAppDelegate sql] updateUserSolved: solved inChater: q.chapterID withType: q.type];
}

@end
