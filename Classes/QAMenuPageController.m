//
//  QAMenuPageController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QAMenuPageController.h"
#import "MMBBAppDelegate.h"
#import "QuestionPagesController.h"

@implementation QAMenuPageController
@synthesize selectedTabIndex, segmentedControl;

// The designated initializer. Override if you create the controller programmatically 
// and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
		
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.pageDataArray = [[MMBBAppDelegate sql] getChapters];
	self.pageControl.numberOfPages = [pageDataArray count];
	[super viewDidLoad];
	
	//Set the title
	[[self navigationItem] setTitle: NSLocalizedString(@"QandA",@"dummy")];
	// setup segment controlls
	[segmentedControl setTitle:NSLocalizedString(@"정문일침", "dummy") forSegmentAtIndex:0];
	[segmentedControl setTitle:NSLocalizedString(@"일망타진", "dummy") forSegmentAtIndex:1];
	
	segmentedControl.momentary = NO;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	segmentedControl.selectedSegmentIndex = 0;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void) pageTouched:(QAMenuItemViewController *) sender {
	QuestionPagesController *qp = [[QuestionPagesController alloc] 
								   initWithNibName:@"QuestionPagesController" bundle:nil ];
	qp.pageDataArray = [[MMBBAppDelegate sql] getQuestionInChapter:sender.itemData.id
														  withType:segmentedControl.selectedSegmentIndex + 1];
	[qp setHidesBottomBarWhenPushed: YES];
	
	if (segmentedControl.selectedSegmentIndex == 0) {
		[[qp navigationItem] setTitle:NSLocalizedString(@"정문일침", "dummy")];
	} else {
		[[qp navigationItem] setTitle:NSLocalizedString(@"일망타진", "dummy")];
	}

	[self.navigationController pushViewController:qp animated:YES];
	[qp release];
}

- (void)loadScrollViewWithPage:(int)page 
{
	if (page < 0) 
		return;
	if (page > [self.pageDataArray count] - 1) 
		return;
	
	UIViewController *controller;
	controller = [self.viewControllers objectAtIndex:page];
	if ((NSNull *)controller == [NSNull null])
	{
		controller = [[QAMenuItemViewController alloc]
					  initWithItemData:[self.pageDataArray objectAtIndex:page]];
		((QAMenuItemViewController *)controller).idelegate = self;
		[self.viewControllers replaceObjectAtIndex:page withObject:controller];
		[self addControllerOnScroller:controller withPageNumber:page];
		[controller release];
	}
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

- (void)dealloc {
    [super dealloc];
}

@end
