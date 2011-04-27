//
//  UnitViewer.h
//  MMBB
//
//  Created by Jin Sung Yoo on 11/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentScrollView.h"
#import "UnitItem.h"
#import "LastUnitView.h"

@interface UnitViewer : UIViewController <UIScrollViewDelegate, LastUnitViewDelegate> {
	UnitItem *unitItem;
	ContentScrollView *scrollView;
	UIBarButtonItem *bookmarkBtn;
}

@property (nonatomic, readonly) ContentScrollView *scrollView;
@property (nonatomic, retain) UnitItem *unitItem;
@property (nonatomic, retain) UIBarButtonItem *bookmarkBtn;

- (id) initWithUnitID:(NSInteger)pUnitID;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
-(void) showQuiz:(LastUnitView *) sender withType:(NSInteger) typeNum isReset: (BOOL) reset;

@end
