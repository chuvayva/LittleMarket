//
//  Product.h
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductType.h"

@interface Product : NSObject <NSCopying, NSCoding>

@property ProductType *productType;

@property NSUInteger number;

-(id) initWithName: (NSString*) name category: (NSString*) category price: (double) price number:(NSUInteger)number;

-(id)initWithProductType:(ProductType *)type andQuantity: (NSUInteger)number;

-(NSComparisonResult)compare:(Product*)otherObject;

@end
