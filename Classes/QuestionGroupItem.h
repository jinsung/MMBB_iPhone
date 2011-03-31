//
//  QuestionGroupItem.h
//  MMBB
//
//  Created by Jin Sung Yoo on 3/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@interface QuestionGroupItem : NSObject {
	NSInteger id;
	NSString *title;
}

@property (nonatomic) NSInteger id;
@property (nonatomic, retain) NSString *title;

@end
