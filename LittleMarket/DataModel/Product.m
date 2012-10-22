//
//  Product.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Product.h"
#import "ProductType.h"


@implementation Product

#pragma mark Instance

-(id) initWithName: (NSString*) name category: (NSString*) category price: (double) price number:(NSUInteger)number
{
    if (!(self = [super init])) return nil;
    
    _productType = [[ProductType alloc]initWithName:name category:category price:price];
        
    _number = number;
    
    
    return  self;
}

-(id)initWithProductType:(ProductType *)type andQuantity: (NSUInteger)number
{
    self = [super init];
    
    if(self)
    {
        _productType = [type copy];
        
        _number = number;
    }
    
    return  self;
}

-(NSComparisonResult)compare:(Product *)otherObject
{
    return [self.productType.name compare:otherObject.productType.name];
}

#pragma mark Ovverides
// Product isEqual using for comparing only productType
-(BOOL) isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
        return NO;
    
    Product *product = (Product*)object;
    
    return [self.productType isEqual: [product productType]];
}

-(NSString*)description
{
    return [NSString stringWithFormat:@"%@ : %d", self.productType, self.number];
}


#pragma mark NSCopying

-(id) copyWithZone:(NSZone *)zone
{
    Product *copy = [[Product allocWithZone:zone] initWithProductType:[self.productType copy] andQuantity:self.number];
    
    return copy;
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.productType forKey:ProductTypeKey];
    [aCoder encodeInteger:self.number forKey: ProductQuantityKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super init])) return nil;
    
    self.productType = [aDecoder decodeObjectForKey:ProductTypeKey];
    self.number = [aDecoder decodeIntegerForKey:ProductQuantityKey];
    

    return self;
}


@end
