//
//  MMBBFlipsideViewController.h
//  MMBB
//
//  Created by Jin Sung Yoo on 2/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FlipsideViewControllerDelegate;

@interface MMBBFlipsideViewController : UIViewController {
	id <FlipsideViewControllerDelegate> delegate;
}

@property (nonatomic, retain) id <FlipsideViewControllerDelegate> delegate;
@end


@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(MMBBFlipsideViewController *)controller;
@end