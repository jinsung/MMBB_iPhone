//
//  HomeNavController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HomeNavController.h"


@implementation HomeNavController


- (id)init {
	self = [super init];
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:NSLocalizedString(@"Home",@"dummy")];
	
	// create a UIImage from a file.
	UIImage *img = [UIImage imageNamed:@"house.png"];
	[tbi setImage:img];
	
    return self;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
}

- (void)dealloc {
    [super dealloc];
}


@end
