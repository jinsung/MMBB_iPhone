//
//  HomeViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeTableViewController : UITableViewController {
	NSMutableArray *sections;
	NSInteger selectedTabIndex;
}

@property (nonatomic, retain) NSMutableArray *sections;
@property (nonatomic) NSInteger selectedTabIndex;

@end
