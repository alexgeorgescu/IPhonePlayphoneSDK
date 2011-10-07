//
//  PlayphoneSDKUITableViewController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlayphoneSDKUITableViewController.h"

@implementation PlayphoneSDKUITableViewController


- (id) init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        titlesRequired = [[NSMutableArray alloc] init];
        // add all the titles
        [titlesRequired addObject:@"1. Required Integration"];
        [titlesRequired addObject:@"        Login User"];
        [titlesRequired addObject:@"        Dashboard"];
        [titlesRequired addObject:@"        Virtual Economy"];
        
        
        titlesAdvanced = [[NSMutableArray alloc] init];
        // add all the titles
        [titlesAdvanced addObject:@"2. Advanced Features"];
        [titlesAdvanced addObject:@"        Current User Info"];
        [titlesAdvanced addObject:@"        Leaderboards"];
        [titlesAdvanced addObject:@"        Achievements"];
        [titlesAdvanced addObject:@"        Social Graph"];
        [titlesAdvanced addObject:@"        Dashboard Control"];
        [titlesAdvanced addObject:@"        Cloud Storage"];
        [titlesAdvanced addObject:@"        Multiplayer Basics"];
        
        // Set the title of the nav bar 
        [[self navigationItem] setTitle:@"Playphone SDK Demo"];
        
        // Set the back button for getting back here
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
        temporaryBarButtonItem.title = @"Back";
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
        [temporaryBarButtonItem release];
        
        
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    return [self init];
}


- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"Section is %d",section);
    // Return the number of rows in the section.
    if(section == 0)
        return [titlesRequired count];
    else
        return [titlesAdvanced count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    if([indexPath section] == 0)
    [[cell textLabel] setText: [titlesRequired objectAtIndex:[indexPath row]]];
    else
    [[cell textLabel] setText: [titlesAdvanced objectAtIndex:[indexPath row]]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Configure the logic for each selection...
    // This is the required integration
    if([indexPath section] == 0)
    {
        // Show User Login
        if([indexPath row] == 1)
        {
            LoginUserViewController *viewController =
            [[LoginUserViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show dashboard
        if([indexPath row] == 2)
        {
            DashboardViewController *viewController =
            [[DashboardViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Virtual Economy
        if([indexPath row] == 3)
        {
            VirtualEconomyViewController *viewController =
            [[VirtualEconomyViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }


    }
    // These are the advanced features
    else
    {
        // Show Current User
        if([indexPath row] == 1)
        {
            CurrentUserInfoViewController *viewController =
            [[CurrentUserInfoViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Leaderboards
        if([indexPath row] == 2)
        {
            LeaderboardsViewController *viewController =
            [[LeaderboardsViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Achievements
        if([indexPath row] == 3)
        {
            AchievementsViewController *viewController =
            [[AchievementsViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Social Graph
        if([indexPath row] == 4)
        {
            SocialGraphViewController *viewController =
            [[SocialGraphViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Dashboard Control
        if([indexPath row] == 5)
        {
            DashboardControlViewController *viewController =
            [[DashboardControlViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Cloud Storage
        if([indexPath row] == 6)
        {
            CloudStorageViewController *viewController =
            [[CloudStorageViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
        // Show Multiplayer Basics
        if([indexPath row] == 7)
        {
            MultiplayerBasicsViewController *viewController =
            [[MultiplayerBasicsViewController alloc] init];
            
            [self.navigationController pushViewController:viewController animated:YES];
            [viewController release];
        }
    }
    
}

@end
