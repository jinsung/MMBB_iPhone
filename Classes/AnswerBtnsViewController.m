//
//  QuestionViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "AnswerBtnsViewController.h"
#import "MMBBAppDelegate.h"
#import "QuestionView.h"

@interface AnswerBtnsViewController (Private)
- (BOOL)isAnswerCorrect;
@end

@implementation AnswerBtnsViewController

@synthesize question, aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, contentView, questionView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
	}
    return self;
}

- (void)viewDidLoad {
	//[super viewDidLoad];
	questionView = [[QuestionView alloc] initWithQuestionItem:question];
	//self.contentView.frame = CGRectMake(0, self.contentView.frame.origin-76, 
	//									self.contentView.frame.size.width, self.contentView.frame.size.height+76);
	[[self contentView] addSubview: [questionView view]];
	// update quiz button with answer.
	[self update];
}

- (void)update {
	[questionView update];
	if (question.userAnswer>0) {
		NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
		UIButton *btn = [aBtns objectAtIndex:question.userAnswer-1];
		btn.selected = YES;
		if (question.answerPageVisited) {
			if (![self isAnswerCorrect]) {
				btn.selected=NO;				
				btn.enabled=NO;
				UIButton *correctBtn = [aBtns objectAtIndex:question.correctAnswer-1];
				correctBtn.selected=YES;
			}
		}
	}
}

- (IBAction)answerBtnPressed:(UIButton *)sender {
	question.userAnswer = sender.tag;
	[[MMBBAppDelegate sql] updateUserAnswer:sender.tag forQuestionID: question.id ];
	// answer buttons.
	NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
	for (unsigned i=0; i<[aBtns count]; i++) {
		UIButton *btn = [aBtns objectAtIndex:i];
		btn.selected = NO;
	}
	sender.selected = YES;
}

- (void)resetAnswerBtns {
	NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
	for (int i=0; i<[aBtns count]; i++) {
		UIButton *btn = [aBtns objectAtIndex:i];
		btn.enabled = YES;
		btn.selected = NO;
	}
}

- (BOOL)isAnswerCorrect {
	return question.userAnswer==question.correctAnswer;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[aBtn1 release]; 
	[aBtn2 release];
	[aBtn3 release]; 
	[aBtn4 release];
	[aBtn5 release];	
	[question release];
	[questionView release];
    [super dealloc];
}


@end
