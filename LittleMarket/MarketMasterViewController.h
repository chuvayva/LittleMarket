//
//  MarketMasterViewController.h
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketStoreFrontModel.h"

@interface MarketMasterViewController : UITableViewController
{
    id<MarketStoreFrontModel> _model;
}

@end
