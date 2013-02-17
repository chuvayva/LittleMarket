//
//  MarketBackEndModel.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "Product.h"

@protocol MarketBackEndModel <NSObject>

-(NSUInteger)availableProductsCount;

-(Product*) availableProductAtIndex: (NSUInteger) index;

-(void) removeAvailableProductAtIndex: (NSUInteger) index;

-(void) addAvailableProduct: (Product*) product;

-(void)replaceAvailableProduct:(NSArray *)products;

@end
