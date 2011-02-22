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
	UILabel *totalTitleLabel;
	UILabel *quizNumberTitleLabel;
//	UILabel *quizNumberLabel;
}

@property (nonatomic, retain) QuestionPagesController *pageController;
@property (nonatomic, retain) IBOutlet UILabel *totalLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalTitleLabel;
//@property (nonatomic, retain) IBOutlet UILabel *quizNumberLabel;
@property (nonatomic, retain) IBOutlet UILabel *quizNumberTitleLabel;

-(id) initWithPageController: (QuestionPagesController *) pc ;
-(void) update: (NSMutableArray *) questions;
@end
