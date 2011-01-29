//
//  MMBBAppDelegate.m
//  MMBB
//
//  Created by Jin Sung Yoo on 10/31/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MMBBAppDelegate.h"
#import "HomeTableViewController.h"
#import "HomeNavController.h"
#import "QATableViewController.h"
#import "QANavController.h"

static SQLAccess *sql;

@implementation MMBBAppDelegate

@synthesize window;
@synthesize tabBarController;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application 
	didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    tabBarController = [[UITabBarController alloc] init];
	
	// create view controllers
	UIViewController *homeViewController = [[HomeTableViewController alloc] init];
	
	// Create an instance of a UINavigationController
	// its stack contains only itemsViewController
	UINavigationController *homeNavController = [[HomeNavController alloc] 
												 initWithRootViewController:homeViewController];
	
	
	UIViewController *qaViewController = [[QATableViewController alloc] 
										  initWithNibName:@"QATableViewController" 
													   bundle:nil ];
	UINavigationController *qaNavController = [[QANavController alloc]
											   initWithRootViewController:qaViewController];
	
	// make an array containing the two view controllers
	NSArray *viewControlles = 
		[NSArray arrayWithObjects:homeNavController, qaNavController, nil];
	
	// attach them to the tab bar controller
	[tabBarController setViewControllers:viewControlles];

	[window setRootViewController:tabBarController];
    [window makeKeyAndVisible];
    
	//[searchViewController release];
	[homeViewController release];
	[homeNavController release];
	[viewControlles release];
	
    return YES;
}

+ (SQLAccess *) sql {
	if (!sql) {
		sql = [[SQLAccess alloc] init];
	}
	return sql;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
	[tabBarController release];
    [super dealloc];
}


@end
