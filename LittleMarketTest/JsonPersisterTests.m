//
// Created by chuvayva on 20.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "MarketJsonPersister.h"
#import "MarketDataModel.h"
#import <SenTestingKit/SenTestCase.h>


@interface JsonPersisterTests : SenTestCase
@end



@implementation JsonPersisterTests

-(void) testFileNotFoundRaiseException
{
//    NSString *filePath = @"asdvsadv";
//    STAssertThrows([[MarketJsonPersister alloc] initWithFilepath:filePath], @"should throw an exception");

//    filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"LittleMarketData" ofType:@"json"];
//    STAssertNoThrow([[MarketJsonPersister alloc] initWithFilepath:filePath], @"file not found");
}

//-(void) testGetJSONProductListNotNill
//{
//    NSString *filepath = [[NSBundle bundleForClass:[self class]] pathForResource:@"LittleMarketData" ofType:@"json"];
//    id<MarketPersisterProtocol> persister = [[MarketJsonPersister alloc] initWithFilepath:filepath];
//
//    MarketDataModel *model = [persister loadModel] ;
//
//    STAssertNotNil(model, @"Product list doesn't created");
//}
//
//-(void) testJsonProductListHasValidLength
//{
//    NSString *filepath = [[NSBundle bundleForClass:[self class]] pathForResource:@"LittleMarketData" ofType:@"json"];
//    id<MarketPersisterProtocol> persister = [[MarketJsonPersister alloc] initWithFilepath:filepath];
//    MarketDataModel *model = [persister loadModel] ;
//
//    STAssertTrue(model.availableProducts.count == 10, @"Product count is wrong");
//}
//
//-(void) testWriteJson
//{
//    NSString *filepath = [[NSBundle bundleForClass:[self class]] pathForResource:@"LittleMarketData" ofType:@"json"];
//    //NSString *filename = @"Test.json";
//    id<MarketPersisterProtocol> persister = [[MarketJsonPersister alloc] initWithFilepath:filepath];
//    MarketDataModel *model = [persister loadModel] ;
//
//    STAssertNotNil(model, @"model is nil");
//    STAssertTrue(model.availableProducts.count > 0, @"Empty array");
//}

@end