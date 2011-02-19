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


@interface QuestionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, FlipsideViewControllerDelegate> {
	
	QuestionItem *question;
	UITableView *tableView;
	UIImageView *qImage;
	UIButton *aBtn1;
	UIButton *aBtn2;
	UIButton *aBtn3;
	UIButton *aBtn4;
	UIButton *aBtn5;
	UITableViewCell *answerIndicatorCell;
	UIButton *infoBtn;
	UILabel *answerLabel;
	UIViewController *contentsVC;
	UIView *contentView;
}

@property (nonatomic, retain) IBOutlet UIButton *aBtn1;
@property (nonatomic, retain) IBOutlet UIButton *aBtn2;
@property (nonatomic, retain) IBOutlet UIButton *aBtn3;
@property (nonatomic, retain) IBOutlet UIButton *aBtn4;
@property (nonatomic, retain) IBOutlet UIButton *aBtn5;
@property (nonatomic, retain) QuestionItem *question;
@property (nonatomic, retain) IBOutlet UIImageView *qImage;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UITableViewCell *answerIndicatorCell;
@property (nonatomic, retain) IBOutlet UIButton *infoBtn;
@property (nonatomic, retain) IBOutlet UILabel *answerLabel;
@property (nonatomic, retain) IBOutlet UIViewController *contentsVC;
@property (nonatomic, retain) IBOutlet UIView *contentView;

- (IBAction)answerBtnPressed:(UIButton *)sender;
- (IBAction)infoBtnPressed:(UIButton *)sender;
- (void)update;
- (void)flipsideViewControllerDidFinish:(MMBBFlipsideViewController *)controller;

@end
