//
//  LMProduct.h
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMProductType.h"

@interface LMProduct : NSObject <NSCopying, NSCoding>

@property LMProductType *productType;

@property NSUInteger number;

-(id)initWithName: (NSString*) name category: (NSString*) category price: (double) price number:(NSUInteger)number;
-(id)initWithProductType:(LMProductType *)type andQuantity: (NSUInteger)number;

-(NSComparisonResult)compare:(LMProduct *)otherObject;

@end
