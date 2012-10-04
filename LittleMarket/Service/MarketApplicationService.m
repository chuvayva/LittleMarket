//
//  MarketApplicationService.m
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import "MarketApplicationService.h"
#import "MarketPersistenceManagerProtocol.h"
#import "MarketDataModelManagerProtocol.h"

@implementation MarketApplicationService

static MVIOCContainer *_container;

+(MVIOCContainer *)mainContainer
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _container = [MVIOCContainer new];
        
        [[MarketConfigurator new] configureContainer:_container];
    });
    
    return _container;
}

+(void)configurate:(MarketConfigurator *)configurator
{
        [configurator configureContainer: self.mainContainer];
}

+(void)saveApplicationData
{
    id<MarketPersistenceManagerProtocol> persistenceManager = [self.mainContainer getComponent:@protocol(MarketPersistenceManagerProtocol)];
    
    id<MarketDataModelManagerProtocol> dataModelManager = [self.mainContainer getComponent:@protocol(MarketDataModelManagerProtocol)];
    
    [persistenceManager saveModel: dataModelManager.dataModel];

}

+(void)loadApplicationData
{
    id<MarketPersistenceManagerProtocol> persistenceManager = [self.mainContainer getComponent:@protocol(MarketPersistenceManagerProtocol)];
    
    id<MarketDataModelManagerProtocol> dataModelManager = [self.mainContainer getComponent:@protocol(MarketDataModelManagerProtocol)];
    
    dataModelManager.dataModel = [persistenceManager loadModel];
}

@end
