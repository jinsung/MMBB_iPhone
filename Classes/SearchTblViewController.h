//
//  SearchTblViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/26/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchTblViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate> {
	UITableView *_tableView;
	UISearchBar *_searchBar;
	NSMutableArray *_filteredRows;
	NSMutableArray *_copyFilteredRows;
	BOOL _searching;
	BOOL _letUserSelectRow;
	UISearchDisplayController *searchDisplayController;
}

@property(nonatomic, retain) UISearchDisplayController *searchDisplayController;
@property (nonatomic, retain) IBOutlet UISearchBar *searchBar;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *filteredRows;
@property (nonatomic, retain) NSMutableArray *copyFilteredRows;
@property (nonatomic) BOOL searching;
@property (nonatomic) BOOL letUserSelectRow;

@end
