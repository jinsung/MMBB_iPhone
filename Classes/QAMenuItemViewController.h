//
//  QAMenuItemViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionGroupItem.h"

@interface QAMenuItemViewController : UIViewController {
	id idelegate;
	QuestionGroupItem *itemData;
	UIImageView *rimageView;
	UIButton *startBtn;
	UIButton *resetBtn;
	UIButton *getAnswerBtn;
}

@property (nonatomic, retain) id idelegate;
//@property (nonatomic, retain) QuestionGroupItem *itemData;
@property (nonatomic, retain) IBOutlet UIImageView *rimageView;
@property (nonatomic, retain) IBOutlet UIButton	*startBtn;
@property (nonatomic, retain) IBOutlet UIButton	*resetBtn;
@property (nonatomic, retain) IBOutlet UIButton	*getAnswerBtn;

- (id)initWithItemData:(QuestionGroupItem *)data;
- (void)update: (BOOL) solved;
- (IBAction) startBtnTouched: (UIButton *) sender;
- (IBAction) resetBtnTouched: (UIButton *) sender;
- (QuestionGroupItem *)itemData;
@end

@protocol QAMenuItemViewControllerDelegate
- (void) startQuizTouched:(QAMenuItemViewController *) sender withReset: (BOOL) isReset;
@end