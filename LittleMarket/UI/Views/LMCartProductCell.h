//
//  LMProductCell.h
//  LittleMarket
//
//  Created by BiT Superman on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMProduct.h"

@interface LMCartProductCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *productCategory;
@property (weak, nonatomic) IBOutlet UILabel *productNumber;
@property (weak, nonatomic) IBOutlet UILabel *productCost;

-(void) setValuesByProduct:(LMProduct *)product;
@end
