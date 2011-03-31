//
//  QuestionGroupItem.m
//  MMBB
//
//  Created by Jin Sung Yoo on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionGroupItem.h"


@implementation QuestionGroupItem
@synthesize id, title;

- (void)dealloc {
	[title release];
    [super dealloc];
}


@end
