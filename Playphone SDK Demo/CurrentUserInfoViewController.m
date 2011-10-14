//
//  CurrentUserInfoViewController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentUserInfoViewController.h"

@implementation CurrentUserInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // set the title
        [[self navigationItem] setTitle:@"Current User Info"];
        
        // set the back button
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"Back";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
    }
    return self;
}

- (id) init
{
    self = [super init];
    // set the title
    [[self navigationItem] setTitle:@"Current User Info"];
    
    // set the back button
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    [temporaryBarButtonItem release];
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
    //NSLog(@"%@",[MNDirect getSession]);
    //NSLog(@"%@",[[MNDirect getSession] getMyUserName]);
    
    if([MNDirect getSession] != nil)
    {
    [super viewDidLoad];
    [lblUserId setText:[NSString stringWithFormat:@"User id: %qi",[[MNDirect getSession] getMyUserId]]]; 
    [lblUserName setText:[NSString stringWithFormat:@"Username: %@",[[MNDirect getSession] getMyUserName]]]; 
    [lblCurrentRoom setText:[NSString stringWithFormat:@"Current room: %d",[[MNDirect getSession] getCurrentRoomId]]];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
