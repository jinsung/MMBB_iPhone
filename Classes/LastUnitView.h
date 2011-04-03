//
//  LastUnitViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LastUnitView : UIView {
    id delegate;
}

@property (nonatomic, retain) id delegate;

@end

@protocol LastUnitViewDelegate
-(void) showQuiz:(LastUnitView *) sender withType:(NSInteger) typeNum isReset: (BOOL) reset;
@end
