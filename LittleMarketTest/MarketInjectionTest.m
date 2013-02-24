//
//  MarketInjectionTest.m
//  LittleMarket
//
//  Created by BiT on 04.10.12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "LMContainerConfigurator.h"
#import "LMPersistenceManagerProtocol.h"
#import "LMDataModelManager.h"

@protocol LMStoreFrontModel;
@protocol LMBackEndModel;
@protocol LMCartTableModel;
@protocol LMDataModelManagerProtocol;

@interface MarketInjectionTest : SenTestCase
{
    MVIOCContainer *_container;
}

@end




@implementation MarketInjectionTest

-(void)setUp
{
    _container = [MVIOCContainer new];
    [[LMContainerConfigurator new] configureContainer:_container];
}

-(void)testPersisterManager
{
    id<LMPersistenceManagerProtocol> persistenceManager = [_container getComponent:@protocol(LMPersistenceManagerProtocol)];
    STAssertNotNil(persistenceManager, @"PersistenceManager is empty");
    STAssertNotNil(persistenceManager.persister, @"Auto injection not work");    
}

-(void) testMarketDataModel
{
    id<LMBackEndModel> backEndModel = [_container getComponent:@protocol(LMBackEndModel)];
    STAssertNotNil(backEndModel, @"MarketBackEndModel is empty");
    
    id<LMStoreFrontModel> storeFrontModel = [_container getComponent:@protocol(LMStoreFrontModel)];
    STAssertNotNil(storeFrontModel, @"MarketStoreFrontModel is empty");
    
    id<LMCartTableModel> cartTableModel = [_container getComponent:@protocol(LMCartTableModel)];
    STAssertNotNil(cartTableModel, @"MarketCartTableModel is empty");
    
    id<LMDataModelManagerProtocol> marketDataModelManager = [_container getComponent:@protocol(LMDataModelManagerProtocol)];
    STAssertNotNil(marketDataModelManager, @"MarketCartTableModel is empty");
}

-(void)tearDown
{
    _container = nil;
}

@end
