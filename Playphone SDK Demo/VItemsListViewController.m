//
//  VItemsListViewController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VItemsListViewController.h"

@implementation VItemsListViewController
@synthesize dictionaryOfItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    dictionaryOfItems = [NSMutableDictionary dictionaryWithCapacity:10];
    [dictionaryOfItems retain];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if ([[MNDirect vItemsProvider] isGameVItemsListNeedUpdate]) {
            [[MNDirect vItemsProvider] doGameVItemsListUpdate];
        }
        
        // get all the VItems that are not currencies
        NSArray *items = [[MNDirect vItemsProvider] getGameVItemsList];
        [items retain];
        NSLog(@"Item list: %@", items.description);
        
        // create a button for each of them
        for(int i=0;i<[items count];i++)
        {
            // get the game item
            MNGameVItemInfo *gameItem = [items objectAtIndex:i];
            [gameItem retain];
            // add the item to the dictionary by name
            [[self dictionaryOfItems] setObject:gameItem forKey:gameItem.name];
            //create the button
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            //set the position of the button
            button.frame = CGRectMake(20, 45 * (i+1), 280, 35);
            //set the button's title
            [button setTitle:[gameItem name] forState:UIControlStateNormal];
            //listen for clicks
            [button addTarget:self action:@selector(buttonPressed:)              forControlEvents:UIControlEventTouchUpInside];
            //add the button to the view
            [self.view addSubview:button];
        }
    }
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
    // Do any additional setup after loading the view from its nib.
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

- (void) buttonPressed: (id) sender
{
    NSLog(@"Button: %@", sender);
    UIButton *button = (UIButton*) sender;
    NSLog(@"Title: %@", [button titleForState:UIControlStateNormal]);
    NSLog(@"Dictionary: %@",[self dictionaryOfItems]); 
    MNGameVItemInfo *gameItem = [dictionaryOfItems objectForKey:[button titleForState:UIControlStateNormal]];
    NSLog(@"Item: %@", gameItem);
    int itemId = gameItem.vItemId;
    
    
    VItemListDetailsController *viewController =
    [[VItemListDetailsController alloc] initWithItemId: itemId];
    
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];

}

@end
