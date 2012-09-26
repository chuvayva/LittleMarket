//
// Created by chuvayva on 25.09.12.
//


#import "MarketFileManager.h"


@implementation MarketFileManager

+ (NSString *)readFileFromDocumentFolder:(NSString *)filename   error: (NSError **)error
{
    NSArray *urls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];

    NSURL *fileUrl = [[urls objectAtIndex:0] URLByAppendingPathComponent:filename];
    return [NSString stringWithContentsOfURL:fileUrl encoding:NSUTF8StringEncoding error:error];
}


+ (BOOL)writeFile:(NSString *)filename ToDocumentFolderWithContent:(NSString *)content error: (NSError **)error
{
    NSArray *urls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];

    NSURL *fileUrl = [[urls objectAtIndex:0] URLByAppendingPathComponent:filename];

    return [content writeToURL:fileUrl atomically:NO encoding:NSUTF8StringEncoding error:error];
}


@end