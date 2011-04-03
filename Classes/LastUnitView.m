//
//  LastUnitViewController.m
//  MMBB
//
//  Created by Jin Sung Yoo on 4/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LastUnitView.h"


@implementation LastUnitView
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
        
    }
    return self;
}

-(void) drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self setBackgroundColor:[UIColor whiteColor]];
    UIButton *gotoQuizBtn1 = [[UIButton alloc] initWithFrame:CGRectMake(0,0,100,100)];
    [gotoQuizBtn1 setTitle:NSLocalizedString(@"정문일침", @"dummy" ) forState:UIControlStateNormal];
    [gotoQuizBtn1 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:gotoQuizBtn1];
    [gotoQuizBtn1 addTarget:self action:@selector(gotoQuiz1BtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [gotoQuizBtn1 release];
    
    UIButton *gotoQuizBtn2 = [[UIButton alloc] initWithFrame:CGRectMake(110,0,100,100)];
    [gotoQuizBtn2 setTitle:NSLocalizedString(@"일망타진", @"dummy" ) forState:UIControlStateNormal];
    [gotoQuizBtn2 setBackgroundColor:[UIColor grayColor]];
    [self addSubview:gotoQuizBtn2];
    [gotoQuizBtn2 addTarget:self action:@selector(gotoQuiz2BtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [gotoQuizBtn2 release];
    
    UIButton *gotoQuizBtn1withReset = [[UIButton alloc] initWithFrame:CGRectMake(0,110,100,100)];
    [gotoQuizBtn1withReset setTitle:NSLocalizedString(@"정문 reset", @"dummy" ) forState:UIControlStateNormal];
    [gotoQuizBtn1withReset setBackgroundColor:[UIColor grayColor]];
    [self addSubview:gotoQuizBtn1withReset];
    [gotoQuizBtn1withReset addTarget:self action:@selector(gotoQuiz1ResetBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [gotoQuizBtn1withReset release];
    
    UIButton *gotoQuizBtn2withReset = [[UIButton alloc] initWithFrame:CGRectMake(110,110,100,100)];
    [gotoQuizBtn2withReset setTitle:NSLocalizedString(@"일망 reset", @"dummy" ) forState:UIControlStateNormal];
    [gotoQuizBtn2withReset setBackgroundColor:[UIColor grayColor]];
    [self addSubview:gotoQuizBtn2withReset];
    [gotoQuizBtn2withReset addTarget:self action:@selector(gotoQuiz2ResetBtnTouched:) forControlEvents:UIControlEventTouchUpInside];
    [gotoQuizBtn2withReset release];
}

-(void)gotoQuiz1BtnTouched: (id) sender {
    [delegate showQuiz:self withType:1 isReset:NO];
}

-(void)gotoQuiz2BtnTouched: (id) sender {
    [delegate showQuiz:self withType:2 isReset:NO];
}

-(void)gotoQuiz1ResetBtnTouched: (id) sender {
    [delegate showQuiz:self withType:1 isReset:YES];
}

-(void)gotoQuiz2ResetBtnTouched: (id) sender {
    [delegate showQuiz:self withType:2 isReset:YES];
}

-(void)dealloc {
    [super dealloc];
}
@end
