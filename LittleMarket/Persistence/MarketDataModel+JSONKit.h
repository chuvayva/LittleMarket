//
// Created by chuvayva on 22.09.12.
//


#import <Foundation/Foundation.h>
#import "MarketDataModel.h"

@interface MarketDataModel (JSONKit)

+(MarketDataModel *)fromJSONString:(NSString *)jsonString;

-(NSString *)JSONString;

@end