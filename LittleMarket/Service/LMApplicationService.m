//
//  LMApplicationService.m
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import "LMApplicationService.h"
#import "LMPersistenceManagerProtocol.h"
#import "LMDataModelManagerProtocol.h"

@implementation LMApplicationService



+(MVIOCContainer *)mainContainer
{
    static MVIOCContainer *container;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        container = [MVIOCContainer new];
        
        [[LMContainerConfigurator new] configureContainer:container];
    });
    
    return container;
}

+(void)configurate:(LMContainerConfigurator *)configurator
{
        [configurator configureContainer: self.mainContainer];
}

+(void)saveApplicationData
{
    id<LMPersistenceManagerProtocol> persistenceManager = [self.mainContainer getComponent:@protocol(LMPersistenceManagerProtocol)];
    
    id<LMDataModelManagerProtocol> dataModelManager = [self.mainContainer getComponent:@protocol(LMDataModelManagerProtocol)];
    
    [persistenceManager saveModel: dataModelManager.dataModel];

}

+(void)loadApplicationData
{
    id<LMPersistenceManagerProtocol> persistenceManager = [self.mainContainer getComponent:@protocol(LMPersistenceManagerProtocol)];
    
    id<LMDataModelManagerProtocol> dataModelManager = [self.mainContainer getComponent:@protocol(LMDataModelManagerProtocol)];
    
    dataModelManager.dataModel = [persistenceManager loadModel];
}

@end
