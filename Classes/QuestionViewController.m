//
//  QuestionViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "QuestionViewController.h"


@implementation QuestionViewController

@synthesize question, qImage, tableView;


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
	
	qImage.image = [UIImage imageWithContentsOfFile:path];
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
	[tableView release];
	[qImage release];
	[question release];
    [super dealloc];
}


@end
