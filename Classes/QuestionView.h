//
//  QuestionView.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"
#import "QADescriptionFlipsideViewController.h"

@interface QuestionView : UIViewController <UITableViewDelegate, UITableViewDataSource, FlipsideViewControllerDelegate>{
	QuestionItem *question;
	UITableView *tableView;
	UIImageView *qImage;
	UITableViewCell *answerIndicatorCell;
	UIButton *infoBtn;
	UILabel *answerLabel;
}

//@property (nonatomic, retain) QuestionItem *question;
@property (nonatomic, retain) IBOutlet UIImageView *qImage;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITableViewCell *answerIndicatorCell;
@property (nonatomic, retain) IBOutlet UIButton *infoBtn;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;

- (void) update;
- (id) initWithQuestionItem: (QuestionItem *) qi;
- (IBAction) infoBtnPressed:(UIButton *)sender;
- (void) flipsideViewControllerDidFinish:(MMBBFlipsideViewController *)controller;

@end
