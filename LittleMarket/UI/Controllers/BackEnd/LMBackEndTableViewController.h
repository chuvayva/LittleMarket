//
//  LMBackEndTableViewController.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <UIKit/UIKit.h>
#import "LMBackEndModel.h"
#import "LMProductEditViewController.h"

@interface LMBackEndTableViewController : UITableViewController <MarketProductEditViewControllerDelegate>
{
    id<LMBackEndModel> _model;
    
    LMProduct *_editedProduct;
}

@end
