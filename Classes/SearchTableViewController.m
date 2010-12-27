//
//  SearchTableViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/21/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SearchTableViewController.h"


@implementation SearchTableViewController

-(id) init 
{
	self = [super initWithStyle:UITableViewStylePlain];
	if (!self) 
		return nil;	
	return self;
}

-(void) viewDidLoad
{
	[super viewDidLoad];
	self.tableView.tableHeaderView = searchBar;
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
	[searchBar release];
    [super dealloc];
}


@end
