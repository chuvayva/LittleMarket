//
//  MarketInjectionTest.m
//  LittleMarket
//
//  Created by BiT on 04.10.12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "MarketConfigurator.h"
#import "MarketPersistenceManagerProtocol.h"
#import "MarketDataModelManager.h"

@protocol MarketStoreFrontModel;
@protocol MarketBackEndModel;
@protocol MarketCartTableModel;
@protocol MarketDataModelManagerProtocol;

@interface MarketInjectionTest : SenTestCase
{
    MVIOCContainer *_container;
}

@end




@implementation MarketInjectionTest

-(void)setUp
{
    _container = [MVIOCContainer new];
    [[MarketConfigurator new] configureContainer:_container];
}

-(void)testPersisterManager
{
    id<MarketPersistenceManagerProtocol> persistenceManager = [_container getComponent:@protocol(MarketPersistenceManagerProtocol)];
    STAssertNotNil(persistenceManager, @"PersistenceManager is empty");
    STAssertNotNil(persistenceManager.persister, @"Auto injection not work");    
}

-(void) testMarketDataModel
{
    id<MarketBackEndModel> backEndModel = [_container getComponent:@protocol(MarketBackEndModel)];
    STAssertNotNil(backEndModel, @"MarketBackEndModel is empty");
    
    id<MarketStoreFrontModel> storeFrontModel = [_container getComponent:@protocol(MarketStoreFrontModel)];
    STAssertNotNil(storeFrontModel, @"MarketStoreFrontModel is empty");
    
    id<MarketCartTableModel> cartTableModel = [_container getComponent:@protocol(MarketCartTableModel)];
    STAssertNotNil(cartTableModel, @"MarketCartTableModel is empty");
    
    id<MarketDataModelManagerProtocol> marketDataModelManager = [_container getComponent:@protocol(MarketDataModelManagerProtocol)];
    STAssertNotNil(marketDataModelManager, @"MarketCartTableModel is empty");
}

-(void)tearDown
{
    _container = nil;
}

@end
