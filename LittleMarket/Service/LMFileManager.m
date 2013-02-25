//
// Created by chuvayva on 25.09.12.
//


#import "LMFileManager.h"

@implementation LMFileManager

#pragma mark - Static

+ (NSString *)readFileFromDocumentFolder:(NSString *)filename   error: (NSError **)error
{
    NSArray *urls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    NSURL *fileUrl = [[urls objectAtIndex:0] URLByAppendingPathComponent:filename];
    return [NSString stringWithContentsOfURL:fileUrl encoding:NSUTF8StringEncoding error:error];
}

+ (BOOL)writeFile:(NSString *)filename ToDocumentFolderWithContent:(NSString *)content error: (NSError **)error
{
    NSURL* fileUrl = [self.documentUrl URLByAppendingPathComponent:filename];
    
    return [content writeToURL:fileUrl atomically:NO encoding:NSUTF8StringEncoding error:error];
}


+(NSURL*)documentUrl
{
    NSArray *urls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    return [urls objectAtIndex:0];
}

+(NSString *)filepathInDocumentFolderWithFilename:(NSString *)filename
{
    NSArray *documentsUrls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    
    return [[[documentsUrls objectAtIndex:0] URLByAppendingPathComponent:filename] path];
}

@end