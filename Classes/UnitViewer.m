    //
//  UnitViewer.m
//  MMBB
//
//  Created by Jin Sung Yoo on 11/10/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UnitViewer.h"
#import "Constants.h"
#import "MMBBAppDelegate.h"

@interface UnitViewer (Private)

- (void) setHideBars:(BOOL)isHide;
- (void) setupToolbar;
- (void) updateViewBound:(BOOL)isHide;
- (void) forward;
- (void) back;
- (void) bookmark: (UIBarButtonItem *) sender;
- (void) loadWithUnitID: (NSInteger) newId;
- (void) updateToolbarBtns;
- (void) rotateView:(CGFloat) radian;

- (UIBarButtonItem *)backButton;
- (CGImageRef)createBackArrowImageRef;
- (CGContextRef)createContext;

@end

@implementation UnitViewer
@synthesize scrollView, unitItem, backBtn, foreBtn, bookmarkBtn;

- (id) initWithUnitID:(NSInteger)pUnitID {
	self = [super init];
	if (!self) return nil;
	UnitItem * thisUnitItem = [[MMBBAppDelegate sql] getUnitItemByID:pUnitID];
	[self setUnitItem: thisUnitItem];
	return self;
}

- (void)viewWillAppear:(BOOL)animated{
	if ( self.interfaceOrientation == UIInterfaceOrientationPortrait ) {
		[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
		[self rotateView:90];
	} else if ( self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
		[self rotateView:270];
	}
}

- (void)viewDidAppear:(BOOL)animated {
	[self setWantsFullScreenLayout:YES];
	[self.navigationController.view setNeedsLayout];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:YES];
	[[[self navigationController] navigationBar] setBarStyle:UIBarStyleBlack];
	[[[self navigationController] navigationBar] setTranslucent:YES];
	[self setupToolbar];
	[[[self navigationController] toolbar] setBarStyle:UIBarStyleBlack];
	[[[self navigationController] toolbar] setTranslucent:YES];
	[self setHideBars:true];
	
	CGRect bound = [[UIScreen mainScreen] bounds];
	bound = CGRectMake(0, 0, bound.size.height, bound.size.width);
	[[self view] setFrame:bound];
	scrollView = [[ContentScrollView alloc] initWithFrame:bound];
	[self loadWithUnitID:[[self unitItem] id]];
	[self.view addSubview:scrollView];
	
}

- (void)loadWithUnitID: (NSInteger) newId {
	UnitItem * thisUnitItem = [[MMBBAppDelegate sql] getUnitItemByID:newId];
	[self setUnitItem: thisUnitItem];

	NSString *dir = @"";	
	NSString *file;
	if (thisUnitItem.unitType > 0 ) {
		NSString *unitTypeCode = [NSString stringWithFormat:@"-%d", [[self unitItem] unitType]];
		file = [NSString stringWithFormat:@"%d-%d%s", [[self unitItem] chapterID], [[self unitItem] unitNum], unitTypeCode]; 
	} else {
		file = [NSString stringWithFormat:@"%d-%d", [[self unitItem] chapterID], [[self unitItem] unitNum]]; 
	}
	NSString *path = [[NSBundle mainBundle] pathForResource:file
													 ofType:@"png" inDirectory:dir];
	UIImage *image = [UIImage imageWithContentsOfFile:path];
	CGFloat width = image.size.width/2.0;
	CGFloat height = image.size.height/2.0;
	CGRect bound = CGRectMake(0, 0, width, height);

	//[image setBounds: bound];
	UIImageView *imageView = [[UIImageView alloc] 
							  initWithImage:[UIImage imageWithContentsOfFile:path]];
	imageView.frame = bound;
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	[scrollView setContentSize:[imageView bounds].size];
	NSArray *oldImages = [scrollView subviews];
	for (int i=0; i<oldImages.count; i++) {
		UIView *oldImage = [oldImages objectAtIndex:i];
		[oldImage removeFromSuperview];
	}
	
	[scrollView addSubview:imageView];
	[self updateToolbarBtns];
	[imageView release];
	imageView = nil;
}

- (void)rotateView:(CGFloat) radian {
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	self.navigationController.view.transform = CGAffineTransformIdentity;
	self.navigationController.view.transform = CGAffineTransformMakeRotation(radian * M_PI / 180);
	self.navigationController.view.bounds = CGRectMake(0.0, 0.0, 480, 320);
	self.navigationController.view.center = CGPointMake(160.0f, 240.0f);
	[UIView commitAnimations];
}

- (void)viewWillDisappear:(BOOL)animated {
	if ( self.interfaceOrientation == UIInterfaceOrientationPortrait ||
		self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
		[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
		[self rotateView:0];
	}
	
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
	[[[self navigationController] navigationBar] setBarStyle:UIBarStyleDefault];
	[[[self navigationController] navigationBar] setTranslucent:NO];
	[[[self navigationController] toolbar] setBarStyle:UIBarStyleDefault];
	[[self navigationController] setToolbarHidden:YES];
}

- (void) setupToolbar {
	UIBarButtonItem *btnSpace = [[UIBarButtonItem alloc] 
								 initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
								 target:self action:nil];
	foreBtn = [[UIBarButtonItem alloc] 
								initWithBarButtonSystemItem:UIBarButtonSystemItemPlay 
								target:self action:@selector(forward)];
	bookmarkBtn = [[UIBarButtonItem alloc] 
									initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks 
									target:self action:@selector(bookmark:)];
	backBtn = [self backButton];
		
	[self setToolbarItems: [NSArray arrayWithObjects: backBtn, btnSpace, foreBtn, btnSpace, bookmarkBtn, nil]];
	[btnSpace release];
	btnSpace = nil;
}

- (void) updateToolbarBtns {
	if ([[self unitItem] isBookmarked] == 1 ) 
		[bookmarkBtn setEnabled:NO];
	else 
		[bookmarkBtn setEnabled:YES];
}

- (void) forward {
	NSInteger newId = [[self unitItem] id]+1;
	[self loadWithUnitID: newId];
}
- (void) back {
	NSInteger newId = [[self unitItem] id]-1;
	[self loadWithUnitID: newId];
}
- (void) bookmark: (UIBarButtonItem *) sender {
	[[MMBBAppDelegate sql] updateBookmarkUnitWithID: [[self unitItem] id] isBookmark: 1];
	[sender setEnabled:NO];
}

- (void)setHideBars: (BOOL)isHide {
	[[UIApplication sharedApplication] setStatusBarHidden: isHide withAnimation: UIStatusBarAnimationFade];
	[[self navigationController] setNavigationBarHidden:isHide animated: YES];
	[[self navigationController] setToolbarHidden:isHide animated:YES];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		return YES;
	} else {
		return NO;
	}
}

- (void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	if ( self.navigationController.navigationBarHidden ) {
		[self setHideBars:NO];
	} else {
		[self setHideBars:YES];
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

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

// back button draw
- (CGContextRef)createContext
{
	// create the bitmap context
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGContextRef context = CGBitmapContextCreate(nil,27,27,8,0,
												 colorSpace,kCGImageAlphaPremultipliedLast);
	CFRelease(colorSpace);
	return context;
}

- (CGImageRef)createBackArrowImageRef
{
	CGContextRef context = [self createContext];
	
	// set the fill color
	CGColorRef fillColor = [[UIColor blackColor] CGColor];
	CGContextSetFillColor(context, CGColorGetComponents(fillColor));
	
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 2.0f, 11.0f);
	CGContextAddLineToPoint(context, 18.0f, 2.0f);
	CGContextAddLineToPoint(context, 18.0f, 20.0f);
	CGContextClosePath(context);
	CGContextFillPath(context);
	
	// convert the context into a CGImageRef
	CGImageRef image = CGBitmapContextCreateImage(context);
	CGContextRelease(context);
	
	return image;
}

- (UIBarButtonItem *)backButton
{
	CGImageRef theCGImage = [self createBackArrowImageRef];
	UIImage *backImage = [[UIImage alloc] initWithCGImage:theCGImage];
	CGImageRelease(theCGImage);
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backImage
																   style:UIBarButtonItemStylePlain
																  target:self
																  action:@selector(back)];
	
	[backImage release], backImage = nil;
	
	return [backButton autorelease];
}


- (void)dealloc {

	[foreBtn release];
	foreBtn = nil;
	[bookmarkBtn release];
	bookmarkBtn = nil;
	[scrollView release];
	scrollView = nil;
    [super dealloc];
}

@end
