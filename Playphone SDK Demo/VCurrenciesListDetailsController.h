//
//  VCurrenciesListDetailsController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/13/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNDirect.h"
#import "MNVItemsProvider.h"


@interface VCurrenciesListDetailsController : UIViewController
{
    int itemId;
    MNGameVItemInfo *gameItem;
    IBOutlet UILabel *lblId;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblDescription;
    IBOutlet UISwitch *chkIssueOnClient;
    IBOutlet UIImageView *image;
    IBOutlet UITextView *attributes;
    
}

- (id)initWithItemId:(int)currenItemId;

@property int itemId;

@end
