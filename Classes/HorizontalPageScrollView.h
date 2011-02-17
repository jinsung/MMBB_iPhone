//
//  HorizontalPageScrollView.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalPageScrollView : UIScrollView {
	CGPoint _originalPoint;
	BOOL _isHorizontalScroll, _isMultitouch;
	UIView *_currentChild;
}

@end
