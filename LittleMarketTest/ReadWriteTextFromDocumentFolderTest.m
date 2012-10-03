//
// Created by chuvayva on 27.09.12.
//


#import <SenTestingKit/SenTestingKit.h>
#import "MarketFileManager.h"


@interface ReadWriteTextFromDocumentFolderTest : SenTestCase
@end


@implementation ReadWriteTextFromDocumentFolderTest

static NSString *_filepath;
static NSString *_filename;

+(void)setUp
{
    _filename = @"Testfile.json";
    _filepath = [[[MarketFileManager documentUrl] URLByAppendingPathComponent: _filename] path];
    
    NSLog(@"Filepath = (%@)", _filepath);
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:_filepath])
    {
        NSLog(@"fileExists");
        [[NSFileManager defaultManager] removeItemAtPath:_filepath error:nil];
    }
}

-(void)testReadWrite
{
    NSString *content = @"I'm a super content";
    NSError *error;
    [MarketFileManager writeFile:_filename ToDocumentFolderWithContent:content error:&error];
    
    NSLog(@"%@", error);
    
    NSString *readContent = [MarketFileManager readFileFromDocumentFolder:_filename error:&error];
    
    NSLog(@"%@", error);
    NSLog(@"%@", readContent);
    
    STAssertEqualObjects(content, readContent, @"Ups!");
}

+ (void)tearDown
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:_filepath])
    {
        NSLog(@"fileExists");
        [[NSFileManager defaultManager] removeItemAtPath:_filepath error:nil];
    }
    
    _filepath = nil;
}


@end