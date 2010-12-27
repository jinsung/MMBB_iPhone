	//
//  HomeViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/2/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "HomeTableViewController.h"
#import "MMBBAppDelegate.h"
#import "TOCItemCell.h"
#import "ChapterItem.h"
#import "UnitItem.h"
#import "UnitItemsTableViewController.h"
#import "UnitViewer.h"

@interface HomeTableViewController (Private)

- (void) addBookmark;

@end

@implementation HomeTableViewController

@synthesize selectedTabIndex, segmentedControl;

- (void)dealloc {
	[segmentedControl release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    [self.tableView reloadData];
	self.filteredListContent = nil;
	self.tableView.scrollEnabled = YES;
}

-(void) viewDidLoad 
{
	[super viewDidLoad];
	
	// setup segment controlls
	[segmentedControl setTitle:NSLocalizedString(@"TableOfContent", "dummy") forSegmentAtIndex:0];
	[segmentedControl setTitle:NSLocalizedString(@"Term", "dummy") forSegmentAtIndex:1];
	[segmentedControl setTitle:NSLocalizedString(@"Bookmark", "dummy") forSegmentAtIndex:2];

	segmentedControl.momentary = NO;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	segmentedControl.selectedSegmentIndex = 0;
	[self segmentAction:segmentedControl];
}

- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBarHidden = NO;
	[super viewWillAppear:animated];
	[[self tableView] reloadData];
}

- (IBAction) segmentAction: (id) sender {
	[self setSelectedTabIndex: segmentedControl.selectedSegmentIndex];
	[self.tableData removeAllObjects];
	[self.filteredListContent removeAllObjects];
	switch ( self.selectedTabIndex ) {
		case 0:
			self.tableData = [[MMBBAppDelegate sql] getChapters];
			[self setEditing:NO animated:NO];
			[[self navigationItem] setLeftBarButtonItem:nil];
			[[self navigationItem] setRightBarButtonItem:nil];
			break;
		case 1:
			self.tableData = [[MMBBAppDelegate sql] getUnitsInOrder];
			[self setEditing:NO animated:NO];
			[[self navigationItem] setLeftBarButtonItem:nil];
			[[self navigationItem] setRightBarButtonItem:nil];
			break;
		case 2:
			self.tableData = [[MMBBAppDelegate sql] getUnitsInBookmarked];
			// add edit button
			if ([[self tableData] count] > 0 ) {
				[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
			}
			
			UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																						target:self action:@selector(addBookmark)];
			[[self navigationItem] setRightBarButtonItem:addButtonItem];
			[addButtonItem release];
			
			break;
	}
	// create a filtered list that will contain products for the search results table.
	NSInteger numOfItems = 0;
	for (ChapterItem *ci in [self tableData]){
		numOfItems += [ci.units count];
	}
	self.filteredListContent = [NSMutableArray arrayWithCapacity:numOfItems];
	[self.tableView scrollRectToVisible:self.tableView.tableHeaderView.bounds animated:NO]; 
	
	[self.tableView reloadData];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	[super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
	forRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if( self.selectedTabIndex == 2 ) {
		if (editingStyle == UITableViewCellEditingStyleDelete) {
			ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath section]];
			UnitItem *ui = [ci.units objectAtIndex:[indexPath row]];
			BOOL isSQLGood = [[MMBBAppDelegate sql] updateBookmarkUnitWithID:[ui id] isBookmark:0];
			if (isSQLGood) {
				UITableView *myTableView = (UITableView *)self.tableView;
				[ci.units removeObjectAtIndex:[indexPath row]];
				[myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
								   withRowAnimation:UITableViewRowAnimationFade];
				if ([[ci units] count] == 0) {
					[[self tableData] removeObjectAtIndex:[indexPath section]];
					[myTableView deleteSections:[NSIndexSet indexSetWithIndex:[indexPath section]]
							   withRowAnimation:UITableViewRowAnimationFade];
				}
			}
		}
	}
}

- (void) addBookmark {
	// TODO: IMPLEMENT ADD BOOKMARK BUTTON.
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
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		return [self.filteredListContent count];
	} else {
		ChapterItem *ci = [[self tableData] objectAtIndex:section];
		return [ci.units count];
	}
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
	
	// Instead of setting each label directly, we pass it a table items object
	UnitItem *ui = nil;
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		ui = [self.filteredListContent objectAtIndex:[indexPath row]];
	} else {
		ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath section]];	
		ui = [ci.units objectAtIndex:[indexPath row]];
	}
	[cell setTitle:[ui title]];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		return nil;
	} else {
		ChapterItem * ci = [[self tableData] objectAtIndex:section];
		NSString *sectiontitle = nil;
		if (self.selectedTabIndex == 0) {
			sectiontitle = [NSString stringWithFormat:@"%@ - %@", ci.sectionTitle, ci.title];
		} else {
			sectiontitle = ci.title;
		}
		return sectiontitle;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	UnitItem *ui = nil;
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		ui = [self.filteredListContent objectAtIndex:[indexPath row]];		
	} else {
		ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath section]];
		ui = [[ci units] objectAtIndex:[indexPath row]];
	}
	UnitViewer *uv = [[UnitViewer alloc] initWithUnitID: ui.id];
	[uv setHidesBottomBarWhenPushed: YES];
	[self.navigationController pushViewController:uv animated:YES];
	[uv release];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	NSMutableArray *a = [[NSMutableArray alloc] init];

	if (self.selectedTabIndex == 1) {
		// search icon.
		[a addObject:@"{search}"];
		for (int i=0; i<[[self tableData] count]; i++ ) {
			ChapterItem *ci = [[self tableData] objectAtIndex:i];
			[a addObject:[ci title]];
		}
	}
	return [a autorelease];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title 
			   atIndex:(NSInteger)index {
	if ( index == 0 ) {
		[tableView scrollRectToVisible:tableView.tableHeaderView.bounds animated:NO]; 
		return -1;
	} else {
		return index-1;
	}
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

@end
