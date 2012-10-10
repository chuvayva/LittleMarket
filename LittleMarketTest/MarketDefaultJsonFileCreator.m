//
//  MarketDefaultJsonFileCreator.m
//  LittleMarket
//
//  Created by BiT on 02.10.12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "Constants.h"
#import "MarketFileManager.h"

@interface MarketDefaultJsonFileCreator : SenTestCase

@end

@implementation MarketDefaultJsonFileCreator

static NSString *_jsonBundleFileName = @"LittleMarketTestData";
static NSString *_jsonBundleFileExtenstion = @"json";

+(void)setUp
{
    NSString *jsonFilepath = [[NSBundle bundleForClass:[self class]] pathForResource:_jsonBundleFileName ofType:_jsonBundleFileExtenstion];
    NSString *jsonString = [NSString stringWithContentsOfFile:jsonFilepath encoding:NSUTF8StringEncoding error:nil];
    NSError *error;
    
    [MarketFileManager writeFile:JsonFileName ToDocumentFolderWithContent:jsonString error:&error];
}

@end