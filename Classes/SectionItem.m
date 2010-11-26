//
//  SectionItem.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/7/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SectionItem.h"


@implementation SectionItem
@synthesize title, chapters;

- (void) dealloc {
	[title release];
	[chapters release];
	[super dealloc];
}
@end
