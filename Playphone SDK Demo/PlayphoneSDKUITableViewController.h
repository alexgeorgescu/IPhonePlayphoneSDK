//
//  PlayphoneSDKUITableViewController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentUserInfoViewController.h"
#import "LoginUserViewController.h"
#import "DashboardViewController.h"
#import "VirtualEconomyViewController.h"
#import "LeaderboardsViewController.h"
#import "AchievementsViewController.h"
#import "SocialGraphViewController.h"
#import "DashboardControlViewController.h"
#import "CloudStorageViewController.h"
#import "MultiplayerBasicsViewController.h"


@interface PlayphoneSDKUITableViewController : UITableViewController
{    
    NSMutableArray *titlesRequired;
    NSMutableArray *titlesAdvanced;
}
@end
