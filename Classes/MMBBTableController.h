//
//  MMBBTableController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 12/14/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MMBBTableController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchDisplayDelegate, UISearchBarDelegate> {
	UITableView *_tableView;
	UITableView *_origTableView;
	NSMutableArray *filteredListContent;
	NSMutableArray *_tableData;
	BOOL _letUserSelectRow;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UITableView *origTableView;
@property (nonatomic, retain) NSMutableArray *filteredListContent;
@property (nonatomic, retain) NSMutableArray *tableData;
@property (nonatomic) BOOL letUserSelectRow;

@end
