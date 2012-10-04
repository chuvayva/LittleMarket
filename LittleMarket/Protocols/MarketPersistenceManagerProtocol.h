//
//  MarketDataModelManagerProtocol.h
//  LittleMarket
//
//  Created by BiT on 04.10.12.
//
//

#import <Foundation/Foundation.h>
@protocol MarketPersisterProtocol;
@class MarketDataModel;


@protocol MarketPersistenceManagerProtocol <NSObject>

@property (nonatomic, strong) id<MarketPersisterProtocol> persister;

-(void)saveModel: (MarketDataModel*)dataModel;

-(MarketDataModel*) loadModel;

@end
