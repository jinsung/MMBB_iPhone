//
//  QuestionPagesController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMBBPagesController.h"
#import "ChapterItem.h"


@interface QuestionPagesController : MMBBPagesController {	
	ChapterItem *chapterData;
	UILabel *chapterInfoLable;
}

@property (nonatomic, retain) ChapterItem *chapterData;
@property (nonatomic, retain) IBOutlet UILabel *chapterInfoLable;

- (IBAction)changePage:(id)sender;

@end
