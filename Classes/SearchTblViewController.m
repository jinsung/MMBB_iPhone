//
//  SearchTblViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/26/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "SearchTblViewController.h"
#import "SearchNavController.h"
#import "TOCItemCell.h"
#import "MMBBAppDelegate.h"

@implementation SearchTblViewController

- (void)dealloc {
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableData = [[MMBBAppDelegate sql] getChapters];
	// create a filtered list that will contain products for the search results table.
	NSInteger numOfItems = 0;
	for (ChapterItem *ci in [self tableData]){
		numOfItems += [ci.units count];
	}
	self.filteredListContent = [NSMutableArray arrayWithCapacity:numOfItems];
	
	//Set the title
	[[self navigationItem] setTitle: NSLocalizedString(@"Search",@"dummy")];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																				   target:self action:@selector(done)];
	[[self navigationItem] setRightBarButtonItem:doneButton];
	[doneButton release];
}

- (void) done {
	SearchNavController *nv = self.navigationController;
	[nv.mvdelegate modelViewDone:YES];
}

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
	
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		return nil;
	} else {
		ChapterItem * ci = [[self tableData] objectAtIndex:section];
		NSString *sectiontitle = nil;
		sectiontitle = [NSString stringWithFormat:@"%@ - %@", ci.sectionTitle, ci.title];
		return sectiontitle;
	}
}

/////////////////////////////////////////////////////////////////////////////////////////////

- (NSIndexPath *)tableView :(UITableView *)theTableView
   willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (_letUserSelectRow) {
		return indexPath;
	} else {
		return nil;
	}
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

@end
