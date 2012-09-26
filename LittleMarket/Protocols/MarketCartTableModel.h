//
//  MarketCartTableDataModel.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol MarketCartTableModel <NSObject>

-(NSUInteger) cartProductsCount;

-(Product*) cartProductAtIndex: (NSUInteger) index;

-(void)returnCartProductAtIndex: (NSUInteger) index;

-(void)buyAllProducts;

-(void)buyProductAtIndex: (NSUInteger) index;

@end
