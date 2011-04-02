//
//  AnswerSheetViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionPagesController.h"

@interface AnswerSheetViewController : UIViewController {
	QuestionPagesController *pageController;
	UILabel *totalLabel;
    UILabel *totalCorrectLabel;
	UILabel *totalTitleLabel;
	UILabel *quizNumberTitleLabel;
    UIButton *descViewBtn;
//	UILabel *quizNumberLabel;
}

@property (nonatomic, retain) QuestionPagesController *pageController;
@property (nonatomic, retain) IBOutlet UILabel *totalLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalCorrectLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalTitleLabel;
//@property (nonatomic, retain) IBOutlet UILabel *quizNumberLabel;
@property (nonatomic, retain) IBOutlet UILabel *quizNumberTitleLabel;
@property (nonatomic, retain) IBOutlet UIButton *descViewBtn;

-(id) initWithPageController: (QuestionPagesController *) pc ;
- (IBAction)descViewBtnTouch:(id)sender;
-(void) update: (NSMutableArray *) questions;
@end
