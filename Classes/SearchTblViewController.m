//
//  SearchTblViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/26/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "SearchTblViewController.h"
#import "TOCItemCell.h"
#import "MMBBAppDelegate.h"

@interface SearchTblViewController (Private) 
- (void) searchTableView;
@end


@implementation SearchTblViewController

@synthesize searchBar=_searchBar, tableView=_tableView, filteredRows=_filteredRows,
searching=_searching, letUserSelectRow=_letUserSelectRow, copyFilteredRows=_copyFilteredRows, 
searchDisplayController;

- (void)dealloc {
	[_filteredRows release];
	[_copyFilteredRows release];
	[searchDisplayController release];
	[_tableView release];
	[_searchBar release];
    [super dealloc];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	//Set the title
	[[self navigationItem] setTitle: NSLocalizedString(@"Search",@"dummy")];
	
	//Add the search bar
	[[self tableView] setTableHeaderView: _searchBar];
	
	searchDisplayController = [[UISearchDisplayController alloc]
							   initWithSearchBar:_searchBar contentsController:self];
	
	searchDisplayController.delegate = self;
	searchDisplayController.searchResultsDataSource = self;
	searchDisplayController.searchResultsDelegate = self;
}

- (void) searchBarTextDidBeginEditing:(UISearchBar *)theSearchBar {
	_searching = YES;
	_letUserSelectRow = NO;
	[_tableView setScrollEnabled:NO];
	
	// Add the done button.
	UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] 
								initWithBarButtonSystemItem:UIBarButtonSystemItemDone 
								target:self 
								action:@selector(doneSearchingClicked:)];
	[[self navigationItem] setRightBarButtonItem:doneBtn];
	[doneBtn release];
}

- (void) doneSearchingClicked:(id)sender {
	[_searchBar setText:@""];
	[_searchBar resignFirstResponder];
	
	_letUserSelectRow = YES;
	_searching = NO;
	[[self navigationItem] setRightBarButtonItem: nil];
	[_tableView setScrollEnabled:YES];
	
	[_tableView reloadData];
}

- (void) searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	// Remove all objects first.
	[_copyFilteredRows removeAllObjects];
	
	if ([searchText length] > 0 ) {
		_searching = YES;
		_letUserSelectRow = YES;
		[_tableView setScrollEnabled:YES];
		[self searchTableView];
	} else {
		_searching = NO;
		_letUserSelectRow = NO;
		[_tableView setScrollEnabled:NO];
	}
	
	[_tableView reloadData];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{    
    
    NSString *CellIdentifier = @"TOCItemCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell ) {
		cell = [[[TOCItemCell alloc] initWithStyle:UITableViewCellStyleDefault 
								   reuseIdentifier:@"TOCItemCell"] autorelease];
	}
//	[self configureCell:cell forRowAtIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return [_filteredRows count];
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
