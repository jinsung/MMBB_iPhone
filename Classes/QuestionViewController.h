//
//  QuestionViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionItem.h"


@interface QuestionViewController : UIViewController {
	QuestionItem *question;
	UITableView *tableView;
	UIImageView *qImage;
}

@property (nonatomic, retain) QuestionItem *question;
@property (nonatomic, retain) IBOutlet UIImageView *qImage;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
