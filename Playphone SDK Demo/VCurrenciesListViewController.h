//
//  VCurrenciesListViewController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNVItemsProvider.h"
#import "MNDirect.h"
#import "VCurrenciesListDetailsController.h"


@interface VCurrenciesListViewController : UIViewController
{
    NSMutableDictionary *dictionaryOfItems;
}

@property (nonatomic,retain) NSMutableDictionary *dictionaryOfItems;

- (void) buttonPressed: (id) sender;
@end
