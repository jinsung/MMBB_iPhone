//
//  ChapterItem.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/9/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChapterItem.h"


@implementation ChapterItem

@synthesize id, title, subtitle, units;

- (void) dealloc {
	[title release];
	[subtitle release];
	[units release];
	[super dealloc];
}

@end
