//
//  Playphone_SDK_DemoAppDelegate.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Playphone_SDK_DemoAppDelegate.h"
#import "PlayphoneSDKUITableViewController.h"

@implementation Playphone_SDK_DemoAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _viewController = [[PlayphoneSDKUITableViewController alloc] init];
    
    
    // Create an instance of a UINavigationController
    // its stack contains only itemsViewController
    UINavigationController *navController = [[UINavigationController alloc]
                                             initWithRootViewController:_viewController];
    
    // Place navigation controller's view in the window hierarchy
    [_window setRootViewController:navController];
    [navController release];
    
    
    // initialize the Playphone SDK
    [MNDirect prepareSessionWithGameId:10900 gameSecret:@"ae2b10f2-248f58d9-c9654f24-37960337" andDelegate:self];
    
    
    /*
    // add launch functionality
    NSURL* url = [launchOptions objectForKey: UIApplicationLaunchOptionsURLKey];
    
    if (url != nil) {
        return [MNDirect handleOpenURL: url];
    }
    else {
        return NO;
    }*/
    
    
    // add the Playphone Orbit button
    [MNDirectButton initWithLocation:MNDIRECTBUTTON_TOPRIGHT];
    [MNDirectButton show];
    
    [_window makeKeyAndVisible];
    return YES;    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [MNDirect handleOpenURL: url];
}


- (void)mnDirectSessionStatusChangedTo:(NSUInteger)newStatus{
    
    NSLog (@"New status: %d", newStatus);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LogInEvent" object:self];
    
    
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

@end
