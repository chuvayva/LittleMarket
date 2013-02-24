//
//  MarketDataModelManagerProtocol.h
//  LittleMarket
//
//  Created by BiT on 04.10.12.
//
//

#import <Foundation/Foundation.h>

@class MarketDataModel;

@protocol MarketDataModelManagerProtocol <NSObject>

-(MarketDataModel *) dataModel;

-(void)setDataModel:(MarketDataModel *) dataModel;

@end
