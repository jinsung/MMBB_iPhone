//
//  QAMenuItemViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChapterItem.h"

@interface QAMenuItemViewController : UIViewController {
	id idelegate;
	ChapterItem *itemData;
	UIImageView *rimageView;
}

@property (nonatomic, retain) id idelegate;
@property (nonatomic, retain) ChapterItem *itemData;
@property (nonatomic, retain) IBOutlet UIImageView *rimageView;

- (id)initWithItemData:(ChapterItem *)data;
@end

@protocol QAMenuItemViewControllerDelegate
- (void) pageTouched:(QAMenuItemViewController *) sender;
@end