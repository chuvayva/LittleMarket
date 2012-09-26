//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <SenTestingKit/SenTestingKit.h>
#import "JSONKit.h"

@interface JSONTest : SenTestCase
@end


@implementation JSONTest

-(void) testReadJSON
{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_data" ofType:@"txt"];
//    NSString *strings = [[NSString alloc] initWithContentsOfFile:jsonfileURL encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    NSLog(@"%@", [dict objectForKey:@"data"]);
}


@end