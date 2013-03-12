//
//  LMBackEndModel.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "LMProduct.h"

@protocol LMBackEndModel <NSObject>

-(NSUInteger)availableProductsCount;
-(LMProduct *)availableProductAtIndex: (NSUInteger) index;

-(void)removeAvailableProductAtIndex: (NSUInteger) index;
-(void)addAvailableProduct: (LMProduct *) product;
-(void)replaceAvailableProduct:(NSArray *)products;

@end
