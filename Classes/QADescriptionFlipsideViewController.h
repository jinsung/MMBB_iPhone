//
//  QADescriptionFlipsideViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBFlipsideViewController.h"
#import "QuestionItem.h"

@interface QADescriptionFlipsideViewController : MMBBFlipsideViewController <UITableViewDelegate, UITableViewDataSource> {
	QuestionItem *question;
	UITableViewCell *answerIndicatorCell;
	UITableViewCell *descCell;
	UIButton *infoBtn;
	UILabel *answerLabel;
	UILabel *wrongAnswerLable;
	UITextView *descTextView;
}

@property (nonatomic, retain) QuestionItem *question;
@property (nonatomic, retain) IBOutlet UITableViewCell *answerIndicatorCell;
@property (nonatomic, retain) IBOutlet UITableViewCell *descCell;
@property (nonatomic, retain) IBOutlet UIButton *infoBtn;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;
@property (nonatomic, retain) IBOutlet UILabel *wrongAnswerLabel;
@property (nonatomic, retain) IBOutlet UITextView *descTextView;

- (id)initWithQuestionItem: (QuestionItem *) qi;
- (IBAction)flipBtnPressed:(UIButton *)sender;
@end
