//
//  MarketStoreFrontModel.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "BuyProductDelegate.h"
#import "Product.h"

@protocol MarketStoreFrontModel <BuyProductDelegate>

#pragma mark Available

-(NSUInteger)availableProductsCount;

-(Product*) availableProductAtIndex: (NSUInteger) index;

@end
