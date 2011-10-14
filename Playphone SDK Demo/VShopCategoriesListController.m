//
//  VShopCategoriesListController.m
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "VShopCategoriesListController.h"

@implementation VShopCategoriesListController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // get all the VItems that are not currencies
        categories = [[MNDirect vShopProvider] getVShopCategoryList];
        [categories retain];
        
        int vertical_size = 0;
        // create a label for each of them
        for(int i=0;i<[categories count];i++)
        {
            // get the category item
            MNVShopCategoryInfo *categoryItem = [categories objectAtIndex:i];
            [categoryItem retain];
            // create the text for the label
            NSString* title = [NSString stringWithFormat:@"ID: %d    %@",[categoryItem categoryId], [categoryItem name]];
            //create the label
            UILabel *label = [[UILabel alloc] initWithFrame:
                              CGRectMake(20, 45 * (++vertical_size), 280, 35)];
            //set the text
            [label setText:title];
            //clear the background color
            label.backgroundColor = [UIColor clearColor];
            //add the label to the view
            [self.view addSubview:label];
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
    [categories release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
