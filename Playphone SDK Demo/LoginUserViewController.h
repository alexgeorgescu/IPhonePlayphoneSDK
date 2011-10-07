//
//  LoginUserViewController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNDirect.h"
#import "MNDirectUIHelper.h"


@interface LoginUserViewController : UIViewController
{
    IBOutlet UILabel *userIdLabel;
    IBOutlet UILabel *loginNameLabel;
    IBOutlet UILabel *loginStateLabel;
    IBOutlet UIButton *btnLogin;
    IBOutlet UIButton *btnLogout;
    Boolean userLoggedIn;
}

- (IBAction)onLoginPressed:(id)sender;
- (IBAction)onLogoutPressed:(id)sender;
- (void)notify:(NSNotification *)notification;
- (void)setAllControls;

@end
