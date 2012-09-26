//
//  MarketPersisterProtocol.h
//  LittleMarket
//
//  Created by BiT on 13.08.12.
//
//

#import <Foundation/Foundation.h>

@class MarketDataModel;

@protocol MarketPersisterProtocol <NSObject>

-(void)saveModel: (MarketDataModel*)dataModel;

-(MarketDataModel*) loadModel;

@end
