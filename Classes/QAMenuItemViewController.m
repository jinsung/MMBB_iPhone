//
//  QAMenuItemViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QAMenuItemViewController.h"

@implementation QAMenuItemViewController

@synthesize idelegate, rimageView, itemData;

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

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( idelegate && [idelegate respondsToSelector:@selector(pageTouched:)] ) {
		[idelegate pageTouched: self];
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
    [super dealloc];
}


@end
