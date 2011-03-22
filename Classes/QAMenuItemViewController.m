//
//  QAMenuItemViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QAMenuItemViewController.h"

@implementation QAMenuItemViewController

@synthesize idelegate, rimageView, itemData, startBtn, resetBtn, getAnswerBtn;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithItemData:(ChapterItem *)data {
    self = [super initWithNibName:@"QAMenuItemViewController" bundle:nil];
    if (self) {
		itemData = data;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSString *chapterNumber;
	if ([itemData id] < 10) {
		chapterNumber = [NSString stringWithFormat:@"0%d", [itemData id]];
	} else {
		chapterNumber = [NSString stringWithFormat:@"%d", [itemData id]];
	}
	NSString *dir = [NSString stringWithFormat:@"questions/%@", chapterNumber];
	NSString *file = @"selector";
	NSString *path = [[NSBundle mainBundle] pathForResource:file
													 ofType:@"png" inDirectory:dir];
	rimageView.image = nil;
	rimageView.image = [UIImage imageWithContentsOfFile:path];
	[super viewDidLoad];
}

- (void)update: (BOOL) solved {
	if (solved) {
		getAnswerBtn.hidden = NO;
		resetBtn.hidden = NO;
		startBtn.hidden = YES;
	} else {
		resetBtn.hidden = YES;
		getAnswerBtn.hidden = YES;
		startBtn.hidden = NO;
	}
}

- (IBAction) startBtnTouched: (UIButton *) sender {
	if ( idelegate && [idelegate respondsToSelector:@selector(startQuizTouched: withReset: )] ) {
		[idelegate startQuizTouched:self withReset: NO];
	}
}
- (IBAction) resetBtnTouched: (UIButton *) sender {
	if ( idelegate && [idelegate respondsToSelector:@selector(startQuizTouched: withReset:)] ) {
		[idelegate startQuizTouched:self withReset: YES];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.rimageView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[rimageView release];
	[itemData release];
	[startBtn release];
	[resetBtn release];
	[getAnswerBtn release];
    [super dealloc];
}

@end
