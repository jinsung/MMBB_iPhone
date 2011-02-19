//
//  QuestionItem.h
//  MMBB
//
//  Created by Jin Sung Yoo on 1/15/11.
//  Copyright 2011 __MMBB__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionItem : NSObject {
	NSInteger id;
	NSInteger index;
	NSInteger chapterID;
	NSInteger type;
	NSInteger correctAnswer;
	NSInteger userAnswer;
	NSInteger answerPageVisited;
	NSString *answerDesc;
}

@property (nonatomic) NSInteger id;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger chapterID;
@property (nonatomic) NSInteger type;
@property (nonatomic) NSInteger correctAnswer;
@property (nonatomic) NSInteger userAnswer;
@property (nonatomic) NSInteger answerPageVisited;
@property (nonatomic, retain) NSString *answerDesc;

@end
