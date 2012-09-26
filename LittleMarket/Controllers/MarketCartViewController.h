//
//  MarketCartTableViewController.h
//  LittleMarket
//
//  Created by BiT on 29.08.12.
//
//

#import <UIKit/UIKit.h>
#import "MarketCartTableModel.h"

@interface MarketCartViewController : UITableViewController<UIActionSheetDelegate>
{
 
    id<MarketCartTableModel> _model;
    
}

- (IBAction)iWantBuyTheeseProducts:(id)sender;

@end
