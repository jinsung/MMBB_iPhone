//
//  RespondedImageView.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RespondedImageView : UIImageView {
	id rivDelete;
}

@property (nonatomic, retain) id rivDelete;

@end

@protocol RespondedImageViewDelegate
- (void) respondedImageViewTouched:(RespondedImageView *) respondedImageView;
@end



