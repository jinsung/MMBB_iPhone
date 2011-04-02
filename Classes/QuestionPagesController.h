//
//  QuestionPagesController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBPagesController.h"
#import "QuestionGroupItem.h"


@interface QuestionPagesController : MMBBPagesController {	
	QuestionGroupItem *qgData;
	UILabel *chapterInfoLable;
}

@property (nonatomic, retain) QuestionGroupItem *qgData;
@property (nonatomic, retain) IBOutlet UILabel *chapterInfoLable;

- (IBAction)changePage:(id)sender;
- (void) gotoFirstPage: (id)sender;
@end
