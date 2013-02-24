//
//  MarketBackEndTableViewController.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <UIKit/UIKit.h>
#import "MarketBackEndModel.h"
#import "MarketProductEditViewController.h"

@interface MarketBackEndTableViewController : UITableViewController <MarketProductEditViewControllerDelegate>
{
    id<MarketBackEndModel> _model;
    
    Product *_editedProduct;
}

@end
