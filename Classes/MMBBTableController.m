    //
//  MMBBTableController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 12/14/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "MMBBTableController.h"


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

#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
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
