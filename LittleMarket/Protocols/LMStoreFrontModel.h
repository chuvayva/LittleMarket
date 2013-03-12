//
//  LMStoreFrontModel.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "LMBuyProductDelegate.h"
#import "LMProduct.h"

@protocol LMStoreFrontModel <LMBuyProductDelegate>

#pragma mark - Available

-(NSUInteger)availableProductsCount;

-(LMProduct *)availableProductAtIndex: (NSUInteger) index;

@end
