//
//  QuestionItem.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/15/11.
//  Copyright 2011 __MMBB__. All rights reserved.
//

#import "QuestionItem.h"

@implementation QuestionItem

@synthesize id, index, chapterID, type, correctAnswer, userAnswer, answerPageVisited, answerDesc;

- (void) dealloc {
	[answerDesc release];
	[super dealloc];
}

@end
