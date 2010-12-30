    //
//  MMBBNavController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 12/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MMBBNavController.h"
#import "Constants.h"

@implementation MMBBNavController

- (id)init {
	self = [super init];
	
	[[self navigationBar] setTintColor:[Constants mmbbColor]];
    return self;
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return YES;
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
    [super dealloc];
}


@end
