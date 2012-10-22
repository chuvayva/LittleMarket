//
//  ProductType.m
//  LittleMarket
//
//  Created by BiT Superman on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProductType.h"

@implementation ProductType

#pragma mark Static

+(NSString*)stringWithPrice:(double)price
{
    return [NSString stringWithFormat:@"%.2f р.", price];
}

-(id) initWithName: (NSString*) name category: (NSString*) category price: (double) price
{
    if (!(self = [super init])) return nil;

    _name = [name copy];
    _category = [category copy];
    _price = price;
    
    
    return  self;
}

-(NSString*) priceString
{
    return [ProductType stringWithPrice:self.price];
}

#pragma mark Overrides

-(BOOL)isEqual:(id)object
{
    if (![object isKindOfClass:[self class]])
        return NO;
    
    ProductType *type = (ProductType*)object;
    
    return [self.name isEqualToString:type.name] &&
           [self.category isEqualToString:type.category] &&
            self.price == type.price ;
    
}

-(id) copyWithZone:(NSZone *)zone
{
    ProductType *copy = [[ProductType allocWithZone:zone] initWithName:self.name category:self.category price:self.price];
    
    return copy;
}

-(NSString*) description
{
    return [NSString stringWithFormat:@"%@, %@, %@", self.name, self.category, self.priceString];
}

#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:ProductTypeNameKey];
    [aCoder encodeObject:self.category forKey: ProductTypeCategoryKey];
    [aCoder encodeDouble:self.price forKey: ProductTypePriceKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super init])) return nil;
    
    
    self.name = [aDecoder decodeObjectForKey:ProductTypeNameKey];
    self.category = [aDecoder decodeObjectForKey:ProductTypeCategoryKey];
    self.price = [aDecoder decodeDoubleForKey:ProductTypePriceKey];
    
    return self;
}

@end
