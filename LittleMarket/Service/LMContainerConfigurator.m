//
//  LMContainerConfigurator.m
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import "LMContainerConfigurator.h"
#import "LMPersistenceManager.h"
#import "LMDataModelManager.h"

// Persisters
#import "LMDefaultPersister.h"
#import "LMJsonPersister.h"
#import "LMArchivePersister.h"
//

@protocol LMPersistenceManagerProtocol;
@protocol LMPersisterProtocol;
@protocol LMStoreFrontModel;
@protocol LMBackEndModel;
@protocol LMCartTableModel;
@protocol LMDataModelManagerProtocol;

@implementation LMContainerConfigurator

-(void)configureContainer:(MVIOCContainer *)container
{
    // Persister
    [[container withCache] addComponent:[LMJsonPersister class]
                           representing:@protocol(LMPersisterProtocol)];
    
    // Persister Manager
    [[container withCache] addComponent:[LMPersistenceManager class]
                           representing:@protocol(LMPersistenceManagerProtocol)];
    
    // DataModel Manager
    [[container withCache] addComponent:[LMDataModelManager class]
                           representing: @[@protocol(LMStoreFrontModel),
                                           @protocol(LMBackEndModel),
                                           @protocol(LMCartTableModel),
                                           @protocol(LMDataModelManagerProtocol)]];
    
}

@end
