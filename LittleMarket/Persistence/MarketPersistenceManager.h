//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol MarketPersisterProtocol;
@class MarketDataModel;


@interface MarketPersistenceManager : NSObject

@property (nonatomic, strong) id<MarketPersisterProtocol> persister;

+(MarketPersistenceManager*) single;

@end