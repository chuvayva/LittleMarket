//
//  MarketTestClass.m
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import "MarketTestClass.h"

@implementation MarketTestClass

static NSInteger _instanceNumber;

+(void)initialize
{
    _instanceNumber = 0;
}

+(NSInteger)instanceNumber
{
    return _instanceNumber;
}

+(void)setInstanceNumber:(NSInteger)value
{
    _instanceNumber = value;
}

-(id)init
{
    if(self = [super init])
    {
        _instanceNumber++;
    }
    
    return self;
}


@end
