//
//  MarketArchivePersisterTest.m
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "MarketDataModel.h"
#import "MarketPersisterProtocol.h"
#import "MarketDataModel+JSONKit.h"
#import "MarketArchivePersister.h"
#import "MarketFileManager.h"

@interface MarketArchivePersisterTest : SenTestCase

@end

@implementation MarketArchivePersisterTest

static NSString *_jsonBundleSourceFileName = @"LittleMarketTestData";
static NSString *_jsonBundleSourceFileExtenstion = @"json";

static NSString *_archiveTestFilename = @"TestFile.dat";
static NSString *_archiveTestFilepath;

static MarketDataModel *_model;
static id<MarketPersisterProtocol> _persister;

+(void)setUp
{
    NSString *jsonSourceFilepath = [[NSBundle bundleForClass:[self class]] pathForResource:_jsonBundleSourceFileName ofType:_jsonBundleSourceFileExtenstion];
    NSString *jsonSourceString = [NSString stringWithContentsOfFile:jsonSourceFilepath encoding:NSUTF8StringEncoding error:nil];
    _model = [MarketDataModel fromJSONString:jsonSourceString];
    
    _archiveTestFilepath = [[[MarketFileManager documentUrl] URLByAppendingPathComponent: _archiveTestFilename] path];
    _persister = [[MarketArchivePersister alloc] initWithFilepath:_archiveTestFilepath];
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
    
    STAssertEqualObjects(_model.availableProducts[0], readedModel.availableProducts[0], @"Error while unarchiving");
    
    

}

+ (void)tearDown
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:_archiveTestFilepath])
    {
        [[NSFileManager defaultManager] removeItemAtPath:_archiveTestFilepath error:nil];
    }
}



@end
