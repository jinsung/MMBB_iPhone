    //
//  MMBBTabBarController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 3/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MMBBTabBarController.h"


@implementation MMBBTabBarController

@synthesize globalInterfaceOrientation;

- (id) init {
	self = [super init];
	if (self) {
		globalInterfaceOrientation = UIInterfaceOrientationPortrait;
	}
	return self;
}

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == globalInterfaceOrientation);
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
