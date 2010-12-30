//
//  SearchNavController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/21/10.
//  Copyright 2010 Jin Sung Yoo. All rights reserved.
//

#import "BookmarkAdderNavController.h"

@implementation BookmarkAdderNavController

@synthesize mvdelegate;

- (id)init {
	self = [super init];
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:NSLocalizedString(@"Search",@"dummy")];
	
	// create a UIImage from a file.
	//	UIImage *img = [UIImage imageNamed:@"HomeIco.png"];
	//	[tbi setImage:img];
	
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
