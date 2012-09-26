//
//  IMarketDetailDelegate.h
//  LittleMarket
//
//  Created by BiT on 15.08.12.
//
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol BuyProductDelegate <NSObject>

-(void)sentToCartProduct: (Product*) product;

@end
