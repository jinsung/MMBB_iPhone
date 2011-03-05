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

@synthesize question, answerIndicatorCell, descCell, infoBtn, answerLabel, descTextView;

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

- (id)initWithQuestionItem: (QuestionItem *) qi{
	if (self = [super initWithNibName:@"QADescriptionFlipsideViewController" bundle:nil]) {
		self.question = qi;
    }
    return self;
}

- (void)viewDidLoad {
	[self setupDescTextView];
}

- (IBAction)flipBtnPressed:(UIButton *)sender {
	[delegate flipsideViewControllerDidFinish:self];
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
			NSString *answer = [NSString stringWithFormat:@"%@: %d", 
								NSLocalizedString(@"정답", @"dummy"), question.correctAnswer];
			[cell addSubview:[self infoBtn]];
			[cell addSubview:[self answerLabel]];
			[answerLabel setText: answer];
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

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[descCell release];
	[question release];
	[answerIndicatorCell release];
	[descTextView release];
    [super dealloc];
}


@end