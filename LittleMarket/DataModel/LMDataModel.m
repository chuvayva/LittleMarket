//
// Created by chuvayva on 21.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LMDataModel.h"

@implementation LMDataModel

-(id) initWithAvailableProducts:(NSArray *)availableProducts andCartProducts:(NSArray *)cartProducts
{
    if (!(self = [super init])) return nil;

    _availableProducts = [NSMutableArray arrayWithArray:availableProducts];
    _cartProducts = [NSMutableArray arrayWithArray:cartProducts];

    return self;
}
//
//-(id) initWithAvailableProducts:(NSArray *)availableProducts
//{
//    return [self initWithAvailableProducts:availableProducts andCartProducts:[NSArray array]];
//}

-(id) init
{
    return [self initWithAvailableProducts:[NSArray array] andCartProducts:[NSArray array]];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.availableProducts forKey:AvailableProductsKey];
    [aCoder encodeObject:self.cartProducts forKey:CartProductsKey];
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (!(self = [super init])) return nil;
    
    self.availableProducts = [aDecoder decodeObjectForKey:AvailableProductsKey];
    self.cartProducts = [aDecoder decodeObjectForKey:CartProductsKey];
    
    
    return self;
}

@end