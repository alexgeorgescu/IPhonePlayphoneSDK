//
//  VItemListDetailsController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNDirect.h"
#import "MNVItemsProvider.h"


@interface VItemListDetailsController : UIViewController
{
    int itemId;
    MNGameVItemInfo *gameItem;
    IBOutlet UILabel *lblId;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblDescription;
    IBOutlet UISwitch *chkUnique;
    IBOutlet UISwitch *chkConsumable;
    IBOutlet UISwitch *chkIssueOnClient;
    IBOutlet UIImageView *image;
    IBOutlet UITextView *attributes;
    
}

- (id)initWithItemId:(int)currenItemId;

@property int itemId;

@end
