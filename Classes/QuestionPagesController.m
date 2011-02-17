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
- (void)scrollViewDidScroll:(UIScrollView *)sender;
@end


@implementation QuestionPagesController

@synthesize aBtn1, aBtn2, aBtn3, aBtn4, aBtn5;

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
	[super viewDidLoad];
}

- (void)dealloc {
	[aBtn1 release]; 
	[aBtn2 release];
	[aBtn3 release]; 
	[aBtn4 release];
	[aBtn5 release];
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
			controller = [[QuestionViewController alloc] 
						  initWithNibName:@"QuestionViewController" 
						  bundle:nil ];
			((QuestionViewController *)controller).question 
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
	}
}

- (IBAction)answerBtnPressed:(UIButton *)sender {
	//NSLog([NSString stringWithFormat:@"anserBtnPressed - sender tag: %d", sender.tag]);
	int page = self.pageControl.currentPage;
	QuestionItem *currentQuestion = [pageDataArray objectAtIndex:page];
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
