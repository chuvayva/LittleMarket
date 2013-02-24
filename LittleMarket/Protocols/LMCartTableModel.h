//
//  MarketCartTableDataModel.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <Foundation/Foundation.h>
#import "LMProduct.h"

@protocol LMCartTableModel <NSObject>

-(NSUInteger) cartProductsCount;

-(LMProduct *) cartProductAtIndex: (NSUInteger) index;

-(void)returnCartProductAtIndex: (NSUInteger) index;

-(void)buyAllProducts;

-(void)buyProductAtIndex: (NSUInteger) index;

@end
