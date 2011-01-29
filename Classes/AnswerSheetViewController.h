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
	UILabel *answerLabel;
	UILabel *userAnswerLabel;
}

@property (nonatomic, retain) QuestionPagesController *pageController;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;
@property (nonatomic, retain) IBOutlet UILabel *userAnswerLabel;

-(id) initWithPageController: (QuestionPagesController *) pc ;
-(void) update: (NSMutableArray *) questions;
@end
