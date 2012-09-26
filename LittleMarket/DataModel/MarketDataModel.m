//
// Created by chuvayva on 21.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MarketDataModel.h"


@implementation MarketDataModel

@synthesize availableProducts = _availableProducts;

@synthesize cartProducts = _cartProducts;

-(id) initWithAvailableProducts:(NSArray *)availableProducts andCartProducts:(NSArray *)cartProducts
{
    if (self = [super init])
    {
        _availableProducts = [availableProducts mutableCopy];
        _cartProducts = [cartProducts mutableCopy];
    }

    return self;
}

-(id) initWithAvailableProducts:(NSArray *)availableProducts
{
    return [self initWithAvailableProducts:availableProducts andCartProducts:[NSArray array]];
}

-(id) init
{
    return [self initWithAvailableProducts:[NSArray array] andCartProducts:[NSArray array]];
}



@end