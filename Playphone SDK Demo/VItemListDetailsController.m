//
//  VItemListDetailsController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VItemListDetailsController.h"

@implementation VItemListDetailsController
@synthesize itemId;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (id)initWithItemId:(int)currenItemId
{
    [self setItemId:currenItemId];
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
    NSLog(@"This is item id %d",itemId);
    //get object with the id
    gameItem = [[MNDirect vItemsProvider] findGameVItemById:itemId];
    [gameItem retain];
    NSLog(@"Vitem: %@", gameItem);
    NSLog(@"VItem ID: %d",[gameItem vItemId]);
    int itemModel = [gameItem model];
    

    [lblId setText:[NSString stringWithFormat:@"ID: %d", [gameItem vItemId]]];
    [lblName setText:[NSString stringWithFormat:@"%@", [gameItem name]]];
    [lblDescription setText:[NSString stringWithFormat:@"%@", [gameItem description]]];
    [attributes setText:[NSString stringWithFormat:@"%@", [gameItem params]]];
    // set the flags
    [chkUnique setOn:(itemModel & 2)];
    [chkConsumable setOn:(itemModel & 4)];
    [chkIssueOnClient setOn:(itemModel & 512)];
    
     NSString *urlString = [[[MNDirect vItemsProvider] getVItemImageURL:itemId] description];
     NSLog(@"URL: %@",urlString);
     [image setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]]]];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [gameItem release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
