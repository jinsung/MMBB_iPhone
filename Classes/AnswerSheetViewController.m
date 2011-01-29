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

@synthesize pageController, userAnswerLabel, answerLabel;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithPageController: (QuestionPagesController *) pc {
    if ((self = [super initWithNibName:@"AnswerSheetViewController" bundle:nil])) {
        [self setPageController:pc];
    }
    return self;
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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

- (void) update: (NSMutableArray *) questions {
	NSMutableString *answers = [[NSMutableString alloc] initWithString:@"answers: "];
	for (unsigned i=0; i<[questions count]; i++) {
		QuestionItem *item = [questions objectAtIndex:i];
		[answers appendString:[NSString stringWithFormat:@"%d", item.userAnswer]];
	}
	userAnswerLabel.text = answers;	
	[answers release];
}

- (void)dealloc {
	[pageController release];
	[userAnswerLabel release];
	[answerLabel release];
    [super dealloc];
}


@end
