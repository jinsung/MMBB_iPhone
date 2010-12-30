//
//  SearchTblViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/26/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "BookmarkAdderTblViewController.h"
#import "BookmarkAdderNavController.h"
#import "TOCItemCell.h"
#import "MMBBAppDelegate.h"

@interface BookmarkAdderTblViewController (Private)

- (void) initData;

@end


@implementation BookmarkAdderTblViewController

- (void)dealloc {
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	//Set the title
	[[self navigationItem] setTitle: NSLocalizedString(@"Search",@"dummy")];
	
	UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
																				   target:self action:@selector(done)];
	[[self navigationItem] setRightBarButtonItem:doneButton];
	[doneButton release];
	
	[self initData];
	// create a filtered list that will contain products for the search results table.
	NSInteger numOfItems = 0;
	for (ChapterItem *ci in [self tableData]){
		numOfItems += [ci.units count];
	}
	self.filteredListContent = [NSMutableArray arrayWithCapacity:numOfItems];
}

- (void) initData {
	self.tableData = [[MMBBAppDelegate sql] getChapters];
}

- (void) done {
	BookmarkAdderNavController *nv = (BookmarkAdderNavController *)self.navigationController;
	[nv.mvdelegate modelViewDone:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
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
	
	if ([ui isBookmarked]) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}

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

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	UnitItem *ui = nil;
	if ([self tableView] == self.searchDisplayController.searchResultsTableView) {
		ui = [self.filteredListContent objectAtIndex:[indexPath row]];		
	} else {
		ChapterItem *ci = [[self tableData] objectAtIndex:[indexPath section]];
		ui = [[ci units] objectAtIndex:[indexPath row]];
	}

	if (ui.isBookmarked) {
		[[MMBBAppDelegate sql] updateBookmarkUnitWithID: [ui id] isBookmark: 0];
		[ui setIsBookmarked:0];
	} else {
		[[MMBBAppDelegate sql] updateBookmarkUnitWithID: [ui id] isBookmark: 1];
		[ui setIsBookmarked:1];
	}
	[self initData];
	[tableView reloadData];
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
