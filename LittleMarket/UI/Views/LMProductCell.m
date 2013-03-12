//
//  LMProductCell.m
//  LittleMarket
//
//  Created by BiT Superman on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LMProductCell.h"

@implementation LMProductCell

-(void) setValuesByProduct:(LMProduct *)product
{
    self.productName.text = product.productType.name;
    self.productCategory.text = product.productType.category;
    self.productCost.text = product.productType.priceString;
    self.productNumber.text = [NSString stringWithFormat:@"%d", (int)product.number];
}

@end
