    //
//  UnitItemsTableViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UnitItemsTableViewController.h"
#import "MMBBAppDelegate.h"
#import "TOCItemCell.h"
#import "UnitItem.h"
#import "UnitViewer.h"

@implementation UnitItemsTableViewController

@synthesize units;

- (id) initWithChapterID:(NSInteger)chapterID {
	self = [super init];
	if (!self) 
		return nil;
	[self setUnits: [[MMBBAppDelegate sql] getUnitsInChapterID: chapterID]];
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	[[self navigationController] setNavigationBarHidden:NO];
	[super viewWillAppear:animated];
	[[self tableView] reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section 
{
	return [units count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Get an instance of a HomepwnerItemCell - either an unused one or a new one
	TOCItemCell *cell = (TOCItemCell *)[tableView 
										dequeueReusableCellWithIdentifier:@"TOCItemCell"];
	if (!cell)
		cell = [[[TOCItemCell alloc] initWithStyle:UITableViewCellStyleDefault 
								   reuseIdentifier:@"TOCItemCell"] autorelease];
	
	UnitItem *ui = [units objectAtIndex:[indexPath row]];
	[cell setTitle:ui.title];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	UnitItem *ui = [units objectAtIndex:[indexPath row]];
	UnitViewer *uv = [[UnitViewer alloc] initWithUnitID: ui.id];
	[uv setHidesBottomBarWhenPushed: YES];
	[self.navigationController pushViewController:uv animated:YES];
	[uv release];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
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
    [super dealloc];
}


@end
