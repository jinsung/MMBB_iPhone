//
//  QuestionPagesController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBPagesController.h"


@interface QuestionPagesController : MMBBPagesController {
	
	// answer buttons
	UIButton *aBtn1;
	UIButton *aBtn2;
	UIButton *aBtn3;
	UIButton *aBtn4;
	UIButton *aBtn5;
}

@property (nonatomic, retain) IBOutlet UIButton *aBtn1;
@property (nonatomic, retain) IBOutlet UIButton *aBtn2;
@property (nonatomic, retain) IBOutlet UIButton *aBtn3;
@property (nonatomic, retain) IBOutlet UIButton *aBtn4;
@property (nonatomic, retain) IBOutlet UIButton *aBtn5;

- (IBAction)changePage:(id)sender;
- (IBAction)answerBtnPressed:(UIButton *)sender;

@end
