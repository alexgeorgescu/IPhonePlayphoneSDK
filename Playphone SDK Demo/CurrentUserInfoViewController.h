//
//  CurrentUserInfoViewController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MNDirect.h"
#import "MNSession.h"

@interface CurrentUserInfoViewController : UIViewController
{
    IBOutlet UILabel *lblUserName;
    IBOutlet UILabel *lblUserId;
    IBOutlet UILabel *lblCurrentRoom;
}
@end
