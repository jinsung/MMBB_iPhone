    //
//  HomeViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HomeTableViewController.h"
#import "MMBBAppDelegate.h"
#import "TOCItemCell.h"
#import "SectionItem.h"
#import "ChapterItem.h"
#import "UnitItem.h"
#import "UnitItemsTableViewController.h"
#import "UnitViewer.h"

@interface HomeTableViewController (Private)

- (void) addBookmark;

@end


@implementation HomeTableViewController

@synthesize sections, selectedTabIndex;

-(id) init 
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (!self) 
		return nil;	
	
	// setup segment controlls
	NSArray *segmentBtnLabels = [NSArray arrayWithObjects: NSLocalizedString(@"TableOfContent", "dummy"), 
									   NSLocalizedString(@"Term", "dummy"), NSLocalizedString(@"Bookmark", "dummy"), nil];
	
	UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] 
											initWithItems:segmentBtnLabels];
	segmentedControl.momentary = NO;
	
	// CUSTOMIZE THE SEGMENTED CONTROL
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 0;
	
	// add control to the navigation bar.
	[[self navigationItem] setTitleView: segmentedControl];
	[segmentedControl release];
	
	return self;
}

- (void)viewWillAppear:(BOOL)animated
{
	self.navigationController.navigationBarHidden = NO;
	[super viewWillAppear:animated];
	[[self tableView] reloadData];
}

- (void) segmentAction: (id) sender {
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	[self setSelectedTabIndex: segmentedControl.selectedSegmentIndex];
	switch ( self.selectedTabIndex ) {
		case 0:
			self.sections = [[MMBBAppDelegate sql] getSections];
			[self setEditing:NO animated:NO];
			[[self navigationItem] setLeftBarButtonItem:nil];
			[[self navigationItem] setRightBarButtonItem:nil];
			break;
		case 1:
			self.sections = [[MMBBAppDelegate sql] getUnitsInOrder];
			[self setEditing:NO animated:NO];
			[[self navigationItem] setLeftBarButtonItem:nil];
			[[self navigationItem] setRightBarButtonItem:nil];
			break;
		case 2:
			self.sections = [[MMBBAppDelegate sql] getUnitsInBookmarked];
			// add edit button
			if ([[self sections] count] > 0 ) {
				[[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
			}
			/*
			 TOODO: ADD BUTTON?
			UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
																						target:self action:@selector(addBookmark)];
			[[self navigationItem] setRightBarButtonItem:addButtonItem];
			[addButtonItem release];
			 */
			break;
	}
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
		ChapterItem *ci = [sections objectAtIndex:[indexPath section]];
		UnitItem *ui = [ci.units objectAtIndex:[indexPath row]];
		BOOL isSQLGood = [[MMBBAppDelegate sql] updateBookmarkUnitWithID:[ui id] isBookmark:0];
		if (isSQLGood) {
			UITableView *myTableView = (UITableView *)self.tableView;
			[ci.units removeObjectAtIndex:[indexPath row]];
			[myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] 
							   withRowAnimation:UITableViewRowAnimationFade];
			if ([[ci units] count] == 0) {
				[[self sections] removeObjectAtIndex:[indexPath section]];
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

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [sections count] ;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if ( selectedTabIndex == 0 ) {
		SectionItem * si = [sections objectAtIndex:section];
		return [si.chapters count];
	} else {
		ChapterItem *ci = [sections objectAtIndex:section];
		return [ci.units count];
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{    
	// Get an instance of a HomepwnerItemCell - either an unused one or a new one
	TOCItemCell *cell = (TOCItemCell *)[tableView 
										dequeueReusableCellWithIdentifier:@"TOCItemCell"];
	if (!cell)
		cell = [[[TOCItemCell alloc] initWithStyle:UITableViewCellStyleDefault 
										 reuseIdentifier:@"TOCItemCell"] autorelease];
	
	// Instead of setting each label directly, we pass it a table items object
	if ( selectedTabIndex == 0 ) {
		SectionItem * si = [sections objectAtIndex:[indexPath section]];
		ChapterItem *ci = [si.chapters objectAtIndex:[indexPath row]];
		[cell setTitle:[ci title]];
	} else {
		ChapterItem *ci = [sections objectAtIndex:[indexPath section]];
		UnitItem *ui = [ci.units objectAtIndex:[indexPath row]];
		[cell setTitle:[ui title]];
	}
    
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	SectionItem * si = [sections objectAtIndex:section];
	return si.title;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if ( selectedTabIndex == 0 ) {
		SectionItem * si = [sections objectAtIndex:[indexPath section]];
		ChapterItem *ci = [si.chapters objectAtIndex:[indexPath row]];
	
		UnitItemsTableViewController *uitvc = [[UnitItemsTableViewController alloc] initWithChapterID:ci.id];	
		[self.navigationController pushViewController:uitvc animated:YES];
		[uitvc release];
	} else {
		ChapterItem *ci = [sections objectAtIndex:[indexPath section]];
		UnitItem *ui = [[ci units] objectAtIndex:[indexPath row]];
		UnitViewer *uv = [[UnitViewer alloc] initWithUnitID: ui.id];
		[uv setHidesBottomBarWhenPushed: YES];
		[self.navigationController pushViewController:uv animated:YES];
		[uv release];
	}
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
	if (self.selectedTabIndex == 1) {
		NSMutableArray *a = [[NSMutableArray alloc] init];
		for (int i=0; i<[sections count]; i++ ) {
			ChapterItem *ci = [sections objectAtIndex:i];
			[a addObject:[ci title]];
		}
		return a;
	} else {
		return nil;
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
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
	[sections release];
    [super dealloc];
}


@end
