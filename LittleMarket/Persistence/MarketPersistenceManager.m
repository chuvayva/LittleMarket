//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MarketPersistenceManager.h"
#import "MarketPersisterProtocol.h"
#import "MarketDataModel.h"


@implementation MarketPersistenceManager

static MarketPersistenceManager *_single;

+(MarketPersistenceManager*) single
{
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        _single = [self new];
    });

    return  _single;
}

@synthesize persister = _persister;

@end