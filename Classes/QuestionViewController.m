//
//  QuestionViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 1/2/11.
//  Copyright 2011 MMBB. All rights reserved.
//

#import "QuestionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "MMBBAppDelegate.h"

@interface QuestionViewController (Private)
- (void)updateAnswerBtns;
- (BOOL)isAnswerCorrect;
@end

@implementation QuestionViewController

@synthesize question, qImage, tableView, aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, 
			answerIndicatorCell, infoBtn, answerLabel, contentsVC, contentView;

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
	
//contentsVC.view.frame.origin = CGPointMake(0, 0);
	[[self contentView] addSubview: [contentsVC view]];

	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	// update quiz button with answer.
	[self update];
}

- (void)update {
	[self dismissModalViewControllerAnimated:YES];
	[self updateAnswerBtns];
}

- (void)updateAnswerBtns {
	if (question.userAnswer>0) {
		NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
		UIButton *btn = [aBtns objectAtIndex:question.userAnswer-1];
		btn.selected = YES;
		if (question.answerPageVisited) {
			if (![self isAnswerCorrect]) {
				btn.selected=NO;				
				btn.enabled=NO;
				UIButton *correctBtn = [aBtns objectAtIndex:question.correctAnswer-1];
				correctBtn.selected=YES;
			}
		}
	}
}

- (void)resetAnswerBtns {
	NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
	for (int i=0; i<[aBtns count]; i++) {
		UIButton *btn = [aBtns objectAtIndex:i];
		btn.enabled = YES;
		btn.selected = NO;
	}
}

- (BOOL)isAnswerCorrect {
	return question.userAnswer==question.correctAnswer;
}

- (IBAction)answerBtnPressed:(UIButton *)sender {
	question.userAnswer = sender.tag;
	[[MMBBAppDelegate sql] updateUserAnswer:sender.tag forQuestionID: question.id ];
	// answer buttons.
	NSArray *aBtns = [NSArray arrayWithObjects: aBtn1, aBtn2, aBtn3, aBtn4, aBtn5, nil];
	for (unsigned i=0; i<[aBtns count]; i++) {
		UIButton *btn = [aBtns objectAtIndex:i];
		btn.selected = NO;
	}
	sender.selected = YES;
}

- (IBAction)infoBtnPressed:(UIButton *)sender {
	QADescriptionFlipsideViewController *descVC = [[QADescriptionFlipsideViewController alloc] init];
	descVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	descVC.delegate = self;
	[contentsVC presentModalViewController:descVC animated:YES];
	[descVC release];
	descVC = nil;
}

- (void)flipsideViewControllerDidFinish:(MMBBFlipsideViewController *)controller {
	[contentsVC dismissModalViewControllerAnimated:YES];
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
			NSString *answer = [NSString stringWithFormat:@"%@: %d", 
								NSLocalizedString(@"정답", @"dummy"), question.correctAnswer];
			[cell addSubview:[self infoBtn]];
			[cell addSubview:[self answerLabel]];
			[answerLabel setText: answer];
		} else {
			[cell addSubview:qImage];
		}
	} else {
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
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[aBtn1 release]; 
	[aBtn2 release];
	[aBtn3 release]; 
	[aBtn4 release];
	[aBtn5 release];	
	[tableView release];
	[qImage release];
	[question release];
	[answerIndicatorCell release];
	[infoBtn release];
	[answerLabel release];
	[contentsVC release];
	[contentView release];
    [super dealloc];
}


@end
