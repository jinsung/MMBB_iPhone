//
//  QuestionViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "QuestionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MMBBAppDelegate.h"

@interface QuestionViewController (Private)
- (void)updateQuestionBtn;
@end

@implementation QuestionViewController

@synthesize question, qImage, tableView, aBtn1, aBtn2, aBtn3, aBtn4, aBtn5;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		
	}
    return self;
}

- (void)viewDidLoad {
	NSString *chapterNumber;
	if ([question chapterID] < 10) {
		chapterNumber = [NSString stringWithFormat:@"0%d", [question chapterID]];
	} else {
		chapterNumber = [NSString stringWithFormat:@"%d", [question chapterID]];
	}
	NSString *dir = [NSString stringWithFormat:@"questions/%@/%d", chapterNumber, question.type];
	NSString *file;
	if ([question index] < 10 ) {
		file = [NSString stringWithFormat:@"0%d", [question index]];
	} else {
		file = [NSString stringWithFormat:@"%d", [question index]]; 
	}
	NSString *path = [[NSBundle mainBundle] pathForResource:file
													 ofType:@"png" inDirectory:dir];
	qImage.layer.cornerRadius = 10.0f;
	qImage.layer.masksToBounds = YES;
	qImage.layer.borderColor = [[UIColor whiteColor] CGColor];
	qImage.layer.backgroundColor = [[UIColor grayColor] CGColor];
	qImage.layer.borderWidth = 1.0f;
	qImage.image = [UIImage imageWithContentsOfFile:path];
	
	// update quiz button with answer.
	[self updateQuestionBtn];
}

- (void)updateQuestionBtn {
	if (question.userAnswer>0) {
		NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
		UIButton *btn = [aBtns objectAtIndex:question.userAnswer-1];
		btn.selected = YES;
	}
}

- (IBAction)answerBtnPressed:(UIButton *)sender {
	//NSLog([NSString stringWithFormat:@"anserBtnPressed - sender tag: %d", sender.tag]);
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

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[tableView release];
	[qImage release];
	[question release];
    [super dealloc];
}


@end
