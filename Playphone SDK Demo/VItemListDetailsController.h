//
//  VItemListDetailsController.h
//  Playphone SDK Demo
//
//  Created by Alex Georgescu on 10/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VItemListDetailsController : UIViewController
{
    int itemId;
}

- (id)initWithItemId:(int)currenItemId;

@property int itemId;

@end
