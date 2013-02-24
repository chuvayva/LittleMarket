//
//  IMarketDetailDelegate.h
//  LittleMarket
//
//  Created by BiT on 15.08.12.
//
//

#import <Foundation/Foundation.h>
#import "LMProduct.h"

@protocol LMBuyProductDelegate <NSObject>

-(void)sentToCartProduct: (LMProduct *) product;

@end
