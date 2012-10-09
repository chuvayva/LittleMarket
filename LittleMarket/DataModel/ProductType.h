//
//  ProductType.h
//  LittleMarket
//
//  Created by BiT Superman on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductType : NSObject <NSCopying, NSCoding>

+(NSString*)stringWithPrice:(double)price;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *category;

@property double price;

-(NSString*) priceString;

-(id) initWithName: (NSString*) name category: (NSString*) category price: (double) price ;

@end
