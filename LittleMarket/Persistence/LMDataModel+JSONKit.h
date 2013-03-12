//
// Created by chuvayva on 22.09.12.
//


#import <Foundation/Foundation.h>
#import "LMDataModel.h"

@interface LMDataModel (JsonKit)

+(LMDataModel *)fromJsonString:(NSString *)jsonString;

-(NSString *)jsonString;

@end