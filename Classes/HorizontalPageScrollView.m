//
//  HorizontalPageScrollView.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HorizontalPageScrollView.h"

// RemorsefulScrollView.m

// the numbers from an example in Apple docs, may need to tune them
#define kThresholdX 12.0f
#define kThresholdY 4.0f

@implementation HorizontalPageScrollView

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		self.delaysContentTouches = NO;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		self.delaysContentTouches = NO;
	}
	return self;
}

- (UIView *)honestHitTest:(CGPoint)point withEvent:(UIEvent *)event {
	UIView *result = nil;
	for (UIView *child in self.subviews)
		if ([child pointInside:point withEvent:event])
			if ((result = [child hitTest:point withEvent:event]) != nil)
				break;
	return result;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event]; // always forward touchesBegan -- there's no way to forward it later
    if (_isHorizontalScroll)
		return; // UIScrollView is in charge now
    if ([touches count] == [[event touchesForView:self] count]) { // initial touch
		_originalPoint = [[touches anyObject] locationInView:self];
		_currentChild = [self honestHitTest:_originalPoint withEvent:event];
		_isMultitouch = NO;
    }
	_isMultitouch = ([[event touchesForView:self] count] > 1);
	[_currentChild touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	if (!_isHorizontalScroll && !_isMultitouch) {
		CGPoint point = [[touches anyObject] locationInView:self];
		if (fabsf(_originalPoint.x - point.x) > kThresholdX && fabsf(_originalPoint.y - point.y) < kThresholdY) {
			_isHorizontalScroll = YES;
			[_currentChild touchesCancelled:[event touchesForView:self] withEvent:event];
		}
	}
	if (_isHorizontalScroll) {
		[super touchesMoved:touches withEvent:event]; // UIScrollView only kicks in on horizontal scroll
	} else {
		[_currentChild touchesMoved:touches withEvent:event];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if (_isHorizontalScroll)
		[super touchesEnded:touches withEvent:event];
    else {
		[super touchesCancelled:touches withEvent:event];
		[_currentChild touchesEnded:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	[super touchesCancelled:touches withEvent:event];
	if (!_isHorizontalScroll)
		[_currentChild touchesCancelled:touches withEvent:event];
}

@end
