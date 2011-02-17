//
//  RespondedImageView.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RespondedImageView.h"


@implementation RespondedImageView
@synthesize rivDelete;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( rivDelete || [rivDelete respondsToSelector:@selector(respondedImageViewTouched:)] ) {
		[rivDelete respondedImageViewTouched: self];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
