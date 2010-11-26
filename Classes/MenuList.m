//
//  MenuList.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MenuList.h"


@implementation MenuList

@synthesize items;


-(void) dealloc {
	[items release];
	[super dealloc];
}

@end
