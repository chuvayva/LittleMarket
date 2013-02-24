//
// Created by chuvayva on 22.09.12.
//


#import <Foundation/Foundation.h>
#import "LMDataModel.h"

@interface LMDataModel (JSONKit)

+(LMDataModel *)fromJSONString:(NSString *)jsonString;

-(NSString *)JSONString;

@end