//
//  LMProductCell.m
//  LittleMarket
//
//  Created by BiT Superman on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LMBackEndProductCell.h"

@implementation LMBackEndProductCell
@synthesize productName;
@synthesize productCategory;
@synthesize productCost;
@synthesize productNumber;

-(void) setValuesByProduct:(LMProduct *)product
{
    productName.text = product.productType.name;
    productCategory.text = product.productType.category;
    productCost.text = product.productType.priceString;
    productNumber.text = [NSString stringWithFormat:@"%d", (int)product.number];
}

@end
