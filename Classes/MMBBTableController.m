    //
//  MMBBTableController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 12/14/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "MMBBTableController.h"
#import "ChapterItem.h"
#import "UnitItem.h"
#import "TOCItemCell.h"

@implementation MMBBTableController

@synthesize tableView=_tableView, 
origTableView=_origTableView,
filteredListContent=_filteredListContent,
tableData=_tableData,
letUserSelectRow=_letUserSelectRow;

- (void)dealloc {
	[_tableView release];
	[_origTableView release];
	[_filteredListContent release];
	[_tableData release];
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self setOrigTableView:[self tableView]];
	[super viewDidLoad];
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

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		return 1;
	} else {
		return [[self tableData] count];
	}
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
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
	
	return cell;
}


#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	// Update the filtered array based on the search text and scope.
	[self.filteredListContent removeAllObjects]; // First clear the filtered array.
	// Search the main list for products whose type matches the scope (if selected) and 
	// whose name matches searchText; add items tha match to the filtered array.
	for (int i=0; i<[[self tableData] count]; i++ ) {
		ChapterItem *ci = [[self tableData] objectAtIndex:i];
		for (UnitItem *ui in [ci units]) {
			NSComparisonResult result = 
			[ui.title compare:searchText 
					  options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) 
						range:NSMakeRange(0, [searchText length])];
			if (result == NSOrderedSame) {
				[self.filteredListContent addObject:ui];
			}
		}
	}
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *) controller
shouldReloadTableForSearchString:(NSString *)searchString
{
	[self filterContentForSearchText:searchString scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles] 
	  objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];

	// Return YES to cause the search result table view to be reloaded.
	return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *) controller
shouldReloadTableForSearchScope:(NSInteger)searchOption
{
	[self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
	 [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
	
	// Return YES to cause the search result table view to be reloaded.
	return YES;
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller 
{
	[self setTableView: [self.searchDisplayController searchResultsTableView]];
	[self.tableView reloadData];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller
{
	[self setTableView: [self origTableView]];
	[self.tableView reloadData];
}

@end
