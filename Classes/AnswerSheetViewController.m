//
//  AnswerSheetViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnswerSheetViewController.h"
#import "QuestionItem.h"

@implementation AnswerSheetViewController

@synthesize pageController, totalLabel, totalTitleLabel, quizNumberTitleLabel;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithPageController: (QuestionPagesController *) pc {
    if ((self = [super initWithNibName:@"AnswerSheetViewController" bundle:nil])) {
        [self setPageController:pc];
    }
    return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	totalTitleLabel.text = NSLocalizedString(@"총점", @"dummy");
	quizNumberTitleLabel.text =NSLocalizedString(@"틀린문제", @"dummy");
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

- (void) update: (NSMutableArray *) questions {
//	NSMutableString *answers = [[NSMutableString alloc] initWithString:@"answers: "];
	NSInteger numberOfCorrect = 0;
	for (NSInteger i=0; i<[questions count]; i++) {
		QuestionItem *item = [questions objectAtIndex:i];
		UILabel *quizNumLable = [[UILabel alloc] init];
		quizNumLable.text = [NSString stringWithFormat:@"%d", i+1];
		
		quizNumLable.frame = CGRectOffset(quizNumberTitleLabel.frame, 16*(i+1) + 37, 0);
		[self.view addSubview:quizNumLable];
		quizNumLable.backgroundColor = [UIColor clearColor];
		if (item.correctAnswer==item.userAnswer) {
			numberOfCorrect++;
		} else {
			quizNumLable.textColor = [UIColor redColor];
		}
		[quizNumLable release];
	}
	NSString *totalString = [NSString stringWithFormat:@"%d / %d", numberOfCorrect, [questions count]];
	totalLabel.text = totalString;	
//	[answers release];
}

- (void)dealloc {
	[pageController release];
	[totalLabel release];
	[totalTitleLabel release];
	[quizNumberTitleLabel release];
    [super dealloc];
}


@end
