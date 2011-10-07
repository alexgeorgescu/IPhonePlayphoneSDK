//
//  DashboardViewController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNDirectUIHelper.h"
#import "MNDirectButton.h"

@interface DashboardViewController : UIViewController
{
    IBOutlet UIButton *btnShowLauncher;
    IBOutlet UIButton *btnHideLauncher;
    IBOutlet UIButton *showDashboard;
}

-(IBAction)onShowLauncherClicked:(id)sender;
-(IBAction)onHideLauncherClicked:(id)sender;
-(IBAction)onShowDashboardClicked:(id)sender;


@end