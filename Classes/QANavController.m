    //
//  QANavController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 12/30/10.
//  Copyright 2010 MMBB. All rights reserved.
//

#import "QANavController.h"


@implementation QANavController

- (id)init {
	self = [super init];
	UITabBarItem *tbi = [self tabBarItem];
	[tbi setTitle:NSLocalizedString(@"QandA",@"dummy")];
	
	// create a UIImage from a file.
	UIImage *img = [UIImage imageNamed:@"house.png"];
	[tbi setImage:img];
	
    return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
