//
// Created by chuvayva on 28.09.12.
//



#import <SenTestingKit/SenTestingKit.h>
#import "MarketTestClass.h"

@interface InjectionTest : SenTestCase
@end




@implementation InjectionTest

+(void)setUp
{
    [IJContext setDefaultContext:[IJContext new]];
    
    [IJContext defaultContext] registerProt
}



-(void) testSingletonInjection
{
    STFail(@"Not Implemented");
}

+(void)tearDown
{

}


@end