//
//  UnitItem.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UnitItem.h"


@implementation UnitItem

@synthesize id, title, isBookmarked;

- (void) dealloc {
	[title release];
	//[subtitle release];
	[super dealloc];
}

@end
