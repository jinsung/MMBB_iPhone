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
#import "QuestionPagesController.h"

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
- (void) openNavIfEndOfContents:(UIScrollView *)scrollView;

- (UIBarButtonItem *)backButton;
- (CGImageRef)createBackArrowImageRef;
- (CGContextRef)createContext;

@end

@implementation UnitViewer
@synthesize scrollView, unitItem, bookmarkBtn;

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
		[(MMBBAppDelegate *)[UIApplication sharedApplication].delegate setOrientation: UIInterfaceOrientationLandscapeRight];
		[self rotateView:90];
	} else if ( self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
		[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
		[(MMBBAppDelegate *)[UIApplication sharedApplication].delegate setOrientation: UIInterfaceOrientationLandscapeRight];
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
	
    //if (!scrollView) {
        CGRect bound = [[UIScreen mainScreen] bounds];
        bound = CGRectMake(0, 0, bound.size.height, bound.size.width);
        [[self view] setFrame:bound];
    
        scrollView = [[ContentScrollView alloc] initWithFrame:bound];
    
        [self loadWithUnitID:[[self unitItem] id]];
        [self.view addSubview:scrollView];
        scrollView.delegate = self;
    //}
}

- (void)loadWithUnitID: (NSInteger) newId {
    NSArray *oldImages = [scrollView subviews];
    
	for (int i=0; i<oldImages.count; i++) {
		UIView *oldImage = [oldImages objectAtIndex:i];
		[oldImage removeFromSuperview];
	}
    
	UnitItem * thisUnitItem = [[MMBBAppDelegate sql] getUnitItemByID:newId];
	[self setUnitItem: thisUnitItem];
	
	[[self navigationItem] setTitle: [NSString stringWithFormat:@"%d. %@", [unitItem unitNum], [unitItem title]]];

	NSString *dir = @"";
	NSString *file;
	if (thisUnitItem.unitType > 0 ) {
		NSString *unitTypeCode = [NSString stringWithFormat:@"-%d", thisUnitItem.unitType];
		file = [NSString stringWithFormat:@"%d-%d%@", [[self unitItem] chapterID], [[self unitItem] unitNum], unitTypeCode]; 
	} else {
        file = [NSString stringWithFormat:@"%d-%d", [[self unitItem] chapterID], [[self unitItem] unitNum]];
	}
	NSString *path = [[NSBundle mainBundle] pathForResource:file
													 ofType:@"png" inDirectory:dir];
    
	UIImage *image = [[UIImage alloc] initWithContentsOfFile:path];
    CGFloat iwidth;
    CGFloat iheight;
    if (image.size.height > 321 ) {
        iwidth = image.size.width/2.0;
        iheight = image.size.height/2.0;
    } else {
        iwidth = image.size.width;
        iheight = image.size.height;
    }
    CGRect bound = CGRectMake(0, 0, iwidth, iheight);
	UIImageView *imageView = [[UIImageView alloc] 
							  initWithImage:image];
    [image release];
    image = nil;
	imageView.frame = bound;
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	
	[scrollView addSubview:imageView];
    [imageView release];
	imageView = nil;
    
    // if this is the last unit for the question group, we display button for user to go to question page.
    if (self.unitItem.questionGroupID > 0) {
        CGRect luvbound = [[UIScreen mainScreen] bounds];
        luvbound = CGRectMake(iwidth, 0, luvbound.size.height, luvbound.size.width);
        LastUnitView *lastUnitView = [[LastUnitView alloc] initWithFrame:luvbound];
        [scrollView addSubview:lastUnitView];
        [lastUnitView setDelegate:self];
        [lastUnitView release];
        bound = CGRectMake(0, 0, iwidth+[lastUnitView bounds].size.width, iheight);
    }
    [scrollView setContentSize:bound.size];
	[scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
	[self updateToolbarBtns];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	[self setHideBars:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)lscrollView willDecelerate:(BOOL)decelerate {
	if (!decelerate) {
		[self openNavIfEndOfContents:lscrollView];
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)lscrollView {
	[self openNavIfEndOfContents:lscrollView];
}

- (void)openNavIfEndOfContents:(UIScrollView *)lscrollView {
	if (scrollView.contentOffset.x >= lscrollView.contentSize.width-lscrollView.frame.size.width) {
		[self setHideBars:NO];
	}
}

- (void)rotateView:(CGFloat) radian {
	[UIView beginAnimations:@"View Flip" context:nil];
	[UIView setAnimationDuration:0.5];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	
	self.navigationController.view.transform = CGAffineTransformIdentity;
	self.navigationController.view.transform = CGAffineTransformMakeRotation(radian * M_PI / 180);
	if (radian == 0) {
		self.navigationController.view.bounds = CGRectMake(0.0, 0.0, 320, 480);
		self.navigationController.view.center = CGPointMake(160.0f, 240.0f);
		self.navigationController.navigationBar.frame = CGRectMake(0, 20, 320, 44); 
	} else {
		self.navigationController.view.bounds = CGRectMake(0.0, 0.0, 480, 320);
		self.navigationController.view.center = CGPointMake(160.0f, 240.0f);
	}	
	[UIView commitAnimations];
}

- (void)viewWillDisappear:(BOOL)animated {
//	if ( self.interfaceOrientation == UIInterfaceOrientationPortrait ||
//		self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ) {
		[[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
		[(MMBBAppDelegate *)[UIApplication sharedApplication].delegate setOrientation: UIInterfaceOrientationPortrait];
		[self rotateView:0];
//	}
	
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
	UIBarButtonItem *foreBtn = [[UIBarButtonItem alloc] 
								initWithBarButtonSystemItem:UIBarButtonSystemItemPlay 
								target:self action:@selector(forward)];
	bookmarkBtn = [[UIBarButtonItem alloc] 
									initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks 
									target:self action:@selector(bookmark:)];
	UIBarButtonItem *backBtn = [self backButton];
		
	[self setToolbarItems: [NSArray arrayWithObjects: backBtn, btnSpace, foreBtn, btnSpace, bookmarkBtn, nil]];

    [foreBtn release];
    foreBtn = nil;
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
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
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

-(void) showQuiz:(LastUnitView *) sender withType:(NSInteger) typeNum isReset: (BOOL) reset; {
    if (self.unitItem.questionGroupID > 0 ) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
        [(MMBBAppDelegate *)[UIApplication sharedApplication].delegate setOrientation: UIInterfaceOrientationPortrait];
        [self rotateView:0];
	
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        [[[self navigationController] navigationBar] setBarStyle:UIBarStyleDefault];
        [[[self navigationController] navigationBar] setTranslucent:NO];
        [[[self navigationController] toolbar] setBarStyle:UIBarStyleDefault];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        [[self navigationController] setToolbarHidden:NO];
        [[self navigationController] setNavigationBarHidden:NO];
    
        QuestionPagesController *qp = [[QuestionPagesController alloc] 
                                       initWithNibName:@"QuestionPagesController" bundle:nil ];
        if (reset) {
            [[MMBBAppDelegate sql] resetQuestionsInGroup: self.unitItem.questionGroupID 
                                                withType: typeNum];
		
        }
        qp.pageDataArray = [[MMBBAppDelegate sql] getQuestionInGroup:self.unitItem.questionGroupID
                                                            withType:typeNum];
    
        qp.qgData = [[MMBBAppDelegate sql] getQuestionGroupItemByGroupID:self.unitItem.questionGroupID];
	
        if (typeNum==1) {
            [[qp navigationItem] setTitle:NSLocalizedString(@"정문일침", "dummy")];
        } else {
            [[qp navigationItem] setTitle:NSLocalizedString(@"일망타진", "dummy")];
        }
    
        [self.navigationController pushViewController:qp animated:YES];
        [qp release];
    }
}

- (void)dealloc {
    [unitItem release];
    unitItem = nil;
	[bookmarkBtn release];
	bookmarkBtn = nil;
	[scrollView release];
	scrollView = nil;
    [super dealloc];
}

@end
