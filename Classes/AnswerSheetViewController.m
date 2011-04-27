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
@synthesize descViewBtn;

@synthesize pageController, totalLabel, totalCorrectLabel, totalTitleLabel, quizNumberTitleLabel;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithPageController: (QuestionPagesController *) pc {
    if ((self = [super initWithNibName:@"AnswerSheetViewController" bundle:nil])) {
        [self setPageController:pc];
    }
    return self;
}

- (IBAction)descViewBtnTouch:(id)sender {
    [pageController gotoFirstPage:self];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	totalTitleLabel.text = NSLocalizedString(@"총점", @"dummy");
	quizNumberTitleLabel.text =NSLocalizedString(@"정답", @"dummy");
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
	NSInteger numberOfCorrect = 0;
    NSInteger hightMultipler = -1;
	for (NSInteger i=0; i<[questions count]; i++) {
		QuestionItem *item = [questions objectAtIndex:i];
		UILabel *quizNumLable = [[UILabel alloc] init];
        NSString *quizAnswerNumID = [NSString stringWithFormat:@"Answer%d", item.correctAnswer];
        if(i<9) {
            quizNumLable.text = [NSString stringWithFormat:@"0%d. %@", i+1, NSLocalizedString(quizAnswerNumID, @"dummy")];
        } else {
            quizNumLable.text = [NSString stringWithFormat:@"%d. %@", i+1, NSLocalizedString(quizAnswerNumID, @"dummy")];
        }
        
        NSInteger threeRounder = i%3;
        if (threeRounder==0) {
            hightMultipler++;
        }
        quizNumLable.frame = CGRectOffset(quizNumberTitleLabel.frame, 78*threeRounder + 80, hightMultipler*20 - 5);
		[self.view addSubview:quizNumLable];
        
        if (item.userAnswer > 0 ) {
            if (item.correctAnswer==item.userAnswer) {
                numberOfCorrect++;
            } else {
                UILabel *quizWrongAnswerLabel = [[UILabel alloc] init];
                quizWrongAnswerLabel.textColor = [UIColor redColor];
                quizWrongAnswerLabel.backgroundColor = [UIColor clearColor];
                NSString *quizWrongAnswerNumID = [NSString stringWithFormat:@"Answer%d", item.userAnswer];
                quizWrongAnswerLabel.text = [NSString stringWithFormat:@"%@", NSLocalizedString(quizWrongAnswerNumID, @"dummy")];
                quizWrongAnswerLabel.frame = CGRectOffset(quizNumLable.frame, 50, 0);
                [self.view addSubview:quizWrongAnswerLabel];
                [quizWrongAnswerLabel release];
                
                // red check marker.
                UIImage *image = [UIImage imageNamed:@"wrong_answer_marker.png"];
                UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
                imageView.frame = CGRectOffset(quizNumLable.frame, -10, -8);
                [self.view addSubview:imageView];
                [imageView release];
            }
        } else {
            quizNumLable.textColor = [UIColor grayColor];
        }
        
		quizNumLable.backgroundColor = [UIColor clearColor];
		
		[quizNumLable release];
	}
	NSString *totalString = [NSString stringWithFormat:@"/%d", [questions count]];
    NSString *totalCorrectString = [NSString stringWithFormat:@"%d", numberOfCorrect];
	totalLabel.text = totalString;	
    totalCorrectLabel.text = totalCorrectString;
}

- (void)dealloc {
	[pageController release];
	[totalLabel release];
	[totalTitleLabel release];
	[quizNumberTitleLabel release];
    [totalCorrectLabel release];
    [descViewBtn release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setTotalCorrectLabel:nil];
    [self setDescViewBtn:nil];
    [super viewDidUnload];
}
@end
