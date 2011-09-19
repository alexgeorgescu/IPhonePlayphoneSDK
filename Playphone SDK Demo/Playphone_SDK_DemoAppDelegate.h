//
//  Playphone_SDK_DemoAppDelegate.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 9/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Playphone_SDK_DemoViewController;

@interface Playphone_SDK_DemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Playphone_SDK_DemoViewController *viewController;

@end
