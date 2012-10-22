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



+(MVIOCContainer *)mainContainer
{
    static MVIOCContainer *container;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        container = [MVIOCContainer new];
        
        [[MarketConfigurator new] configureContainer:container];
    });
    
    return container;
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
