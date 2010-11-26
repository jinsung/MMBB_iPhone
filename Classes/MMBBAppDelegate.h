//
//  MMBBAppDelegate.h
//  MMBB
//
//  Created by Jin Sung Yoo on 10/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SQLAccess.h"

@interface MMBBAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
	UITabBarController* tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabBarController;

+ (SQLAccess *) sql;
@end

