//
//  MarketDetailViewController.h
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMProduct.h"
#import "LMBuyProductDelegate.h"

@interface LMDetailTableViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic) id<LMBuyProductDelegate> delegate;
@property (strong, nonatomic) LMProduct *product;
@property (nonatomic) NSUInteger buyNumber;

@property (weak, nonatomic) IBOutlet UILabel *labelProductName;
@property (weak, nonatomic) IBOutlet UILabel *labelProductCategory;
@property (weak, nonatomic) IBOutlet UILabel *labelProductPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelProductNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldBuyNumber;
@property (weak, nonatomic) IBOutlet UIStepper *stepperMinMaxProduct;
@property (weak, nonatomic) IBOutlet UIButton *buttonBuy;

- (IBAction)iWandBuyIt;
- (IBAction)ProductbuyNumberChanged:(UIStepper *)sender;

@end
