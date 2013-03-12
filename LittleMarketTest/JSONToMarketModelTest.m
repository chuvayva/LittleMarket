//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <SenTestingKit/SenTestingKit.h>
#import "JSONKit.h"
#import "LMDataModel.h"
#import "LMDataModel+JsonKit.h"

@interface JSONToMarketModelTest : SenTestCase
@end


@implementation JSONToMarketModelTest

static NSString *_jsonBundleFileName = @"LittleMarketTestData";
static NSString *_jsonBundleFileExtenstion = @"json";
static NSString *_jsonString;

+(void)setUp
{
    NSString *jsonFilepath = [[NSBundle bundleForClass:[self class]] pathForResource:_jsonBundleFileName ofType:_jsonBundleFileExtenstion];
    _jsonString = [NSString stringWithContentsOfFile:jsonFilepath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", _jsonString);
}

-(void) testJsonStringToMarketModel
{
    LMDataModel *model = [LMDataModel fromJsonString:_jsonString];
    
    STAssertNotNil(model, @"model is nil");
    NSLog(@"%@", model);
}

-(void) testMarketModelToJsonString
{
    LMDataModel *model = [LMDataModel fromJsonString:_jsonString];
    
    NSString *jsonString = [model jsonString];
    
    STAssertNotNil(jsonString, @"json string is nil");
    
    NSLog(@"%@", jsonString);
}


@end