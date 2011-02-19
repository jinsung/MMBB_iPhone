//
//  QADescriptionFlipsideViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBFlipsideViewController.h"

@interface QADescriptionFlipsideViewController : MMBBFlipsideViewController <UITableViewDelegate, UITableViewDataSource> {
	UILabel *descLabel;
}

@property (nonatomic, retain) UILabel *descLabel;

@end
