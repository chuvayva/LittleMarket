//
//  LMApplicationService.h
//  LittleMarket
//
//  Created by BiT on 03.10.12.
//
//

#import <Foundation/Foundation.h>
#import "LMContainerConfigurator.h"

@interface LMApplicationService : NSObject

+(MVIOCContainer*)mainContainer;
+(void)configurate:(LMContainerConfigurator *)configurator;

+(void)saveApplicationData;
+(void)loadApplicationData;

@end
