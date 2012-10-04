//
//  MarketConfigurator.m
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import "MarketConfigurator.h"
#import "MarketPersistenceManager.h"
#import "MarketJsonPersister.h"
#import "MarketDataModelManager.h"

@protocol MarketPersistenceManagerProtocol;
@protocol MarketPersisterProtocol;
@protocol MarketStoreFrontModel;
@protocol MarketBackEndModel;
@protocol MarketCartTableModel;
@protocol MarketDataModelManagerProtocol;

@implementation MarketConfigurator

-(void)configureContainer:(MVIOCContainer *)container
{
    // Persister
    [[container withCache] addComponent:[MarketJsonPersister class]
                           representing:@protocol(MarketPersisterProtocol)];
    
    // Persister Manager
    [[container withCache] addComponent:[MarketPersistenceManager class]
                           representing:@protocol(MarketPersistenceManagerProtocol)];
    
    // DataModel Manager
    [[container withCache] addComponent:[MarketDataModelManager class]
                           representing: @[@protocol(MarketStoreFrontModel),
                                           @protocol(MarketBackEndModel),
                                           @protocol(MarketCartTableModel),
                                           @protocol(MarketDataModelManagerProtocol)]];
    
}

@end
