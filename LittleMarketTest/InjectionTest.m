//
// Created by chuvayva on 28.09.12.
//



#import <SenTestingKit/SenTestingKit.h>
#import "MarketTestClass.h"

@interface InjectionTest : SenTestCase
@end




@implementation InjectionTest

static MVIOCContainer *container;

+(void)setUp
{
//    [MarketTestClass new];
    container = [MVIOCContainer new];
    [[container withCache] addComponent: [MarketTestClass class]];
    NSLog(@"Test class added to container. Instance Number = %d", [MarketTestClass instanceNumber]);
}


-(void) testSingletonInjection
{
    [container getComponent:[MarketTestClass class]];
    [container getComponent:[MarketTestClass class]];
    NSLog(@"Test class added to container. Instance Number = %d", [MarketTestClass instanceNumber]);
    STAssertTrue( [MarketTestClass instanceNumber] == 1, @"");
}

@end