//
// Created by chuvayva on 20.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "MarketJsonPersister.h"
#import <SenTestingKit/SenTestCase.h>
#import "MarketDataModel.h"
#import "MarketDataModel+JSONKit.h"
#import "MarketJsonPersister.h"
#import "MarketFileManager.h"

@interface JsonPersisterTests : SenTestCase
@end



@implementation JsonPersisterTests

static NSString *_jsonBundleSourceFileName = @"LittleMarketTestData";
static NSString *_jsonBundleSourceFileExtenstion = @"json";
static NSString *_jsonTestFilename = @"TestFile.json";
static NSString *_jsonTestFilePath;
static MarketDataModel *_model;
static MarketJsonPersister *_persister;

+(void)setUp
{
    NSString *jsonSourceFilepath = [[NSBundle bundleForClass:[self class]] pathForResource:_jsonBundleSourceFileName ofType:_jsonBundleSourceFileExtenstion];
    NSString *jsonSourceString = [NSString stringWithContentsOfFile:jsonSourceFilepath encoding:NSUTF8StringEncoding error:nil];
    _model = [MarketDataModel fromJSONString:jsonSourceString];
    
    _jsonTestFilePath = [[[MarketFileManager documentUrl] URLByAppendingPathComponent: _jsonTestFilename] path];
    _persister = [[MarketJsonPersister alloc] initWithFilepath:_jsonTestFilePath];
}

-(void) testSaveLoadMarketModel
{
    STAssertNotNil(_model, @"Model is nil");
    
    [_persister saveModel:_model];
    NSLog(@"Model saved");
    
    MarketDataModel *readedModel = [_persister loadModel];
    STAssertNotNil(readedModel, @"Model not loaded");
    STAssertTrue(_model.availableProducts.count == readedModel.availableProducts.count, @"Writen and red model are not equal");
    STAssertTrue(_model.cartProducts.count == readedModel.cartProducts.count, @"Writen and red model are not equal");
}

+ (void)tearDown
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:_jsonTestFilePath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:_jsonTestFilePath error:nil];
    }
}

@end