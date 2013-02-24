//
//  MarketCartTableViewController.h
//  LittleMarket
//
//  Created by BiT on 29.08.12.
//
//

#import <UIKit/UIKit.h>
#import "LMCartTableModel.h"

@interface LMCartViewController : UITableViewController<UIActionSheetDelegate>
{
 
    id<LMCartTableModel> _model;
    
}

- (IBAction)iWantBuyTheeseProducts:(id)sender;

@end
