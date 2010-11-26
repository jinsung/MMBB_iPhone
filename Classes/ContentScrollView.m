//
//  ContentScrollView.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/12/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContentScrollView.h"


@implementation ContentScrollView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)dealloc {
    [super dealloc];
}


@end
