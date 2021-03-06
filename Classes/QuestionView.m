//
//  QuestionView.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuestionView.h"
#import "MMBBAppDelegate.h"

@implementation QuestionView

@synthesize tableView, qImage, answerIndicatorCell, infoBtn,answerLabel;

- (id)initWithQuestionItem: (QuestionItem *) qi{
	if (self == [super initWithNibName:@"QuestionView" bundle:nil]) {
		question = qi;
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
	
	//self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)viewDidUnload {
    [self setQImage:nil];
    [self setTableView:nil];
    [self setAnswerIndicatorCell:nil];
    [self setInfoBtn:nil];
    [self setAnswerLabel:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [tableView release];
	[qImage release];
	[answerIndicatorCell release];
	[infoBtn release];
	[answerLabel release];
	[super dealloc];
}

- (void) update {
	[self.tableView reloadData];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
}

- (IBAction)infoBtnPressed:(UIButton *)sender {
	QADescriptionFlipsideViewController *descVC = 
		[[QADescriptionFlipsideViewController alloc] initWithQuestionItem:question];
	descVC.delegate = self;
	
	//UINavigationController *navigationController = 
	//	[[UINavigationController alloc] initWithRootViewController:descVC];
	descVC.modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
    [descVC navigationController].modalTransitionStyle =  UIModalTransitionStyleFlipHorizontal;
	//[self presentModalViewController:[descVC navigationController] animated:YES];
	[self presentModalViewController:descVC animated:YES];
}

- (void)flipsideViewControllerDidFinish:(MMBBFlipsideViewController *)controller {
	//	[[self contentView] addSubview: [contentsVC view]];
	
	[self dismissModalViewControllerAnimated:YES];
	
	//self.tableView.frame = CGRectOffset(contentView.frame, 0, 76);
	//infoBtn.enabled = YES;
	//infoBtn.selected = NO;
}

/////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (question.userAnswer>0 && question.answerPageVisited==1) {
		return 2;
	} else {
		return 1;
	}
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	// Get an instance of a HomepwnerItemCell - either an unused one or a new one
	UITableViewCell *cell = (UITableViewCell *)[self.tableView 
												dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (!cell)
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:@"TOCItemCell"] autorelease];
	if (question.userAnswer>0 && question.answerPageVisited==1) {
		if (indexPath.row==0) {
			cell = [self answerIndicatorCell];
			NSString *answerStringID = 
				[NSString stringWithFormat:@"%@%d", @"Answer", question.correctAnswer];
			NSString *answer = [NSString stringWithFormat:@"%@ : %@", 
								NSLocalizedString(@"정답", @"dummy"), NSLocalizedString(answerStringID, @"dummy")];
			[cell addSubview:[self infoBtn]];
			[self.answerLabel setText: question.answerDesc];
			[cell addSubview:[self answerLabel]];
			[answerLabel setText: answer];
		} else {
			cell.autoresizesSubviews = YES;
			//cell.indentationLevel
			[cell addSubview:qImage];
		}
	} else {
		cell.autoresizesSubviews = YES;
		[cell addSubview:qImage];
	}
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (question.userAnswer>0 && question.answerPageVisited==1) {
		if (indexPath.row==0) {
			return 44;
		} else {
			return qImage.frame.size.height;
		}
	} else {
		return qImage.frame.size.height;
	}
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

@end
