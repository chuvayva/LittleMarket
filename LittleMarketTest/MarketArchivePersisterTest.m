//
//  MarketArchivePersisterTest.m
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import <SenTestingKit/SenTestingKit.h>
#import "LMDataModel.h"
#import "LMPersisterProtocol.h"
#import "LMDataModel+JsonKit.h"
#import "LMArchivePersister.h"
#import "LMFileManager.h"

@interface MarketArchivePersisterTest : SenTestCase

@end

@implementation MarketArchivePersisterTest

static NSString *_jsonBundleSourceFileName = @"LittleMarketTestData";
static NSString *_jsonBundleSourceFileExtenstion = @"json";

static NSString *_archiveTestFilename = @"TestFile.dat";
static NSString *_archiveTestFilepath;

static LMDataModel *_model;
static id<LMPersisterProtocol> _persister;

+(void)setUp
{
    NSString *jsonSourceFilepath = [[NSBundle bundleForClass:[self class]] pathForResource:_jsonBundleSourceFileName ofType:_jsonBundleSourceFileExtenstion];
    NSString *jsonSourceString = [NSString stringWithContentsOfFile:jsonSourceFilepath encoding:NSUTF8StringEncoding error:nil];
    _model = [LMDataModel fromJsonString:jsonSourceString];
    
    _archiveTestFilepath = [[[LMFileManager documentUrl] URLByAppendingPathComponent: _archiveTestFilename] path];
    _persister = [[LMArchivePersister alloc] initWithFilepath:_archiveTestFilepath];
}

-(void) testSaveLoadMarketModel
{
    STAssertNotNil(_model, @"Model is nil");
    
    [_persister saveModel:_model];
    NSLog(@"Model saved");
    
    LMDataModel *readedModel = [_persister loadModel];
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
