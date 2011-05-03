//
//  QADescriptionFlipsideViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QADescriptionFlipsideViewController.h"

@interface QADescriptionFlipsideViewController (Private)
-(void) setupDescTextView;
@end

@implementation QADescriptionFlipsideViewController

@synthesize question, answerIndicatorCell, descCell, 
infoBtn, answerLabel, wrongAnswerLabel, descTextView;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/
- (void)dealloc {
	[question release];	
	[answerIndicatorCell release];
	[descCell release];
	[infoBtn release];
	[answerLabel release];
	[wrongAnswerLable release];
	[descTextView release];
    [super dealloc];
}

- (id)initWithQuestionItem: (QuestionItem *) qi{
	if (self == [super initWithNibName:@"QADescriptionFlipsideViewController" bundle:nil]) {
		self.question = qi;
    }
    return self;
}

- (void)viewDidLoad {
	[self setupDescTextView];
}

- (void)viewDidUnload {
    [self setAnswerIndicatorCell:nil];
    [self setDescCell:nil];
    [self setInfoBtn:nil];
    [self setAnswerLabel:nil];
    [self setWrongAnswerLabel:nil];
    [self setDescTextView:nil];
    [super viewDidUnload];
}

- (IBAction)flipBtnPressed:(UIButton *)sender {
	[self.delegate flipsideViewControllerDidFinish:self];
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
	UITableViewCell *cell = (UITableViewCell *)[tableView 
												dequeueReusableCellWithIdentifier:@"UITableViewCell"];
	if (!cell) {
		//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
		//							   reuseIdentifier:@"TOCItemCell"] autorelease];
		cell = [self descCell];
	}

	if (question.userAnswer>0 && question.answerPageVisited==1) {
		if (indexPath.row==0) {
			cell = [self answerIndicatorCell];
			[cell addSubview:[self infoBtn]];
			[cell addSubview:[self answerLabel]];
			NSString *correctAnswerStringID = @"";
			
			if (question.userAnswer == question.correctAnswer) {

				correctAnswerStringID =	[NSString stringWithFormat:@"%@%d", @"Answer", question.correctAnswer];
				[answerLabel setText: NSLocalizedString(correctAnswerStringID, @"dummy")];
				[wrongAnswerLable setText:@""];
			} else {
				[wrongAnswerLable setHidden:NO];
				correctAnswerStringID =	
					[NSString stringWithFormat:@"%@%d", @"Answer", question.correctAnswer];
				NSString *wrongAnswerStringID = 
					[NSString stringWithFormat:@"%@%d", @"Answer", question.userAnswer];
				[wrongAnswerLable setText: NSLocalizedString(wrongAnswerStringID, @"dummy")];
				[answerLabel setText: [NSString stringWithFormat:@"%@ %@", NSLocalizedString(correctAnswerStringID, @"dummy"), 
									   NSLocalizedString(@"ArrowMark", @"dummy")]];
			}

		} else {
			//[self setupDescTextView];
		}
	} else {
		//[self setupDescTextView];
	}
	return cell;
}

- (void) setupDescTextView {
	NSString *descString = question.answerDesc;
	NSString *saveString = [descString stringByReplacingOccurrencesOfString: @"\\n" withString: @"\n"];
	[descTextView setText:saveString];
	CGRect frame = descTextView.frame;
	frame.size.height = descTextView.contentSize.height;
	descTextView.frame = frame;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (question.userAnswer>0 && question.answerPageVisited==1) {
		if (indexPath.row==0) {
			return 44;
		} else {
			return descTextView.frame.size.height + 10;
		}
	} else {
		return descTextView.frame.size.height + 10;
	}
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

@end
