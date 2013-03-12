//
// Created by chuvayva on 27.09.12.
//


#import <SenTestingKit/SenTestingKit.h>
#import "LMFileManager.h"


@interface ReadWriteTextFromDocumentFolderTest : SenTestCase
@end


@implementation ReadWriteTextFromDocumentFolderTest

static NSString *_filepath;
static NSString *_filename;

+(void)setUp
{
    _filename = @"Testfile.json";
    _filepath = [[[LMFileManager documentUrl] URLByAppendingPathComponent: _filename] path];
    
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
    [LMFileManager writeFile:_filename toDocumentFolderWithContent:content error:&error];
    
    NSLog(@"%@", error);
    
    NSString *readContent = [LMFileManager readFileFromDocumentFolder:_filename error:&error];
    
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