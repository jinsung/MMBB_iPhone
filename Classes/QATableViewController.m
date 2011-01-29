//
//  QATableViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "QATableViewController.h"
#import "MMBBAppDelegate.h"
#import "ChapterItem.h"
#import "TOCItemCell.h"
#import "QuestionPagesController.h"

@interface QATableViewController (Private)

- (void) initData;

@end


@implementation QATableViewController
@synthesize selectedTabIndex, segmentedControl;

- (IBAction) segmentAction: (id) sender {
	
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	//Set the title
	[[self navigationItem] setTitle: NSLocalizedString(@"QandA",@"dummy")];
	
	// setup segment controlls
	[segmentedControl setTitle:NSLocalizedString(@"정문일침", "dummy") forSegmentAtIndex:0];
	[segmentedControl setTitle:NSLocalizedString(@"일망타진", "dummy") forSegmentAtIndex:1];
 
	segmentedControl.momentary = NO;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	segmentedControl.selectedSegmentIndex = 0;
	[self segmentAction:segmentedControl];
	
	[self initData];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[segmentedControl release];
    [super dealloc];
}

- (void) initData {
	self.tableData = [[MMBBAppDelegate sql] getChapters];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [[self tableData] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Get an instance of a HomepwnerItemCell - either an unused one or a new one
	TOCItemCell *cell = (TOCItemCell *)[self.tableView 
										dequeueReusableCellWithIdentifier:@"TOCItemCell"];
	if (!cell)
		cell = [[[TOCItemCell alloc] initWithStyle:UITableViewCellStyleDefault 
								   reuseIdentifier:@"TOCItemCell"] autorelease];
	
	ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath row]];	
	[cell setTitle:[ci title]];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath section]];
	
	QuestionPagesController *qp = [[QuestionPagesController alloc] 
										  initWithNibName:@"QuestionPagesController" 
										  bundle:nil ];
	qp.questions = [[MMBBAppDelegate sql] getQuestionInChapter:ci.id withType: segmentedControl.selectedSegmentIndex + 1];
	[qp setHidesBottomBarWhenPushed: YES];
	[self.navigationController pushViewController:qp animated:YES];
	[qp release];
}

@end