//
//  MarketDataModelManager.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "MarketStoreFrontModel.h"
#import "MarketBackEndModel.h"
#import "MarketCartTableModel.h"
#import "BuyProductDelegate.h"

@class MarketDataModel;


@interface MarketDataModelManager : NSObject <MarketStoreFrontModel, MarketBackEndModel, MarketCartTableModel>

+(MarketDataModelManager *)single;

+(id<MarketStoreFrontModel>) storeFrontDataModel;

+(id<MarketBackEndModel>) backEndDataModel;

+(id<MarketCartTableModel>) cartTableModel;


@property (nonatomic) MarketDataModel *dataModel;

@end
