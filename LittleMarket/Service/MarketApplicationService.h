//
//  MarketApplicationService.h
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import <Foundation/Foundation.h>
#import "MarketConfigurator.h"

@interface MarketApplicationService : NSObject

+(MVIOCContainer*)mainContainer;

+(void)configurate:(MarketConfigurator*)configurator;

+(void)saveApplicationData;

+(void)loadApplicationData;

@end
