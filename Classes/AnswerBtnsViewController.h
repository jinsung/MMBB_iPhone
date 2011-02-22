//
//  QuestionViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"
#import "QADescriptionFlipsideViewController.h"
#import "QuestionView.h"

@interface AnswerBtnsViewController : UIViewController {
	QuestionItem *question;
	UIButton *aBtn1;
	UIButton *aBtn2;
	UIButton *aBtn3;
	UIButton *aBtn4;
	UIButton *aBtn5;
	UIView *contentView;
	QuestionView *questionView;
}

@property (nonatomic, retain) IBOutlet UIButton *aBtn1;
@property (nonatomic, retain) IBOutlet UIButton *aBtn2;
@property (nonatomic, retain) IBOutlet UIButton *aBtn3;
@property (nonatomic, retain) IBOutlet UIButton *aBtn4;
@property (nonatomic, retain) IBOutlet UIButton *aBtn5;
@property (nonatomic, retain) QuestionItem *question;
@property (nonatomic, retain) IBOutlet UIView *contentView;
@property (nonatomic, retain) QuestionView *questionView;

- (IBAction)answerBtnPressed:(UIButton *)sender;
- (void)update;

@end
