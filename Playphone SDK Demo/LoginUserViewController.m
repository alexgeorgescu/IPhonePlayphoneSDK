//
//  LoginUserViewController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LoginUserViewController.h"

@implementation LoginUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id) init
{
    self = [super init];
    
    // set the title
    [[self navigationItem] setTitle:@"Login User"];
    
    // set the back button
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
	temporaryBarButtonItem.title = @"Back";
	self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
	[temporaryBarButtonItem release];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notify:) name:@"LogInEvent" object:nil];
    
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set the defaults when first showing the app
    if([[MNDirect getSession] getStatus] >= 50)
        userLoggedIn = true;
    else userLoggedIn = false;
    [self setAllControls];
    [self viewWillAppear:true];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"LogInEvent" object:nil];
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) setCurrentUserState
{
    if([[MNDirect getSession] getStatus] >= 50)
    {
        [loginStateLabel setText:@"User is logged in."];
        userLoggedIn = true;
    }
    else
    {
        [loginStateLabel setText:@"User is not logged in."];
        userLoggedIn = false;
    }
}

- (void) setCurrentUserId
{
    NSString *userIdString;
    if(!userLoggedIn)
        userIdString = @"-1";
    else
    {
        long long userid = [[MNDirect getSession] getMyUserId];
        userIdString = [NSString stringWithFormat:@"%qi", userid];
    }
    [userIdLabel setText:userIdString];
}

- (void) setCurrentLoginName
{
    NSString* userName;
    if(!userLoggedIn)
        userName = @"nil";
    else
        userName = [[MNDirect getSession] getMyUserName];
    [loginNameLabel setText:userName];
}

- (void) setAllControls
{
    [self setCurrentUserState];
    [self setCurrentUserId];
    [self setCurrentLoginName];
    [btnLogin setEnabled:!userLoggedIn];
    [btnLogout setEnabled:userLoggedIn];
}


- (IBAction)onLoginPressed:(id)sender
{
    [self setAllControls];
    [MNDirect execAppCommand:@"jumpToUserHome" withParam:nil];
    [MNDirectUIHelper showDashboard];
}

- (IBAction)onLogoutPressed:(id)sender
{
    [self setAllControls];
    [MNDirect execAppCommand:@"jumpToUserProfile" withParam:nil];
    [MNDirectUIHelper showDashboard];
}

- (void)notify:(NSNotification *)notification {
	[self setAllControls];
    [self viewWillAppear:true];
    [MNDirectUIHelper hideDashboard];
    //id notificationSender = [notification object];
}



@end
