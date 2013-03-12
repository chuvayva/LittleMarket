//
// Created by chuvayva on 25.09.12.
//


#import <Foundation/Foundation.h>


@interface LMFileManager : NSObject

+ (NSString *)readFileFromDocumentFolder:(NSString *)filename error:(NSError **)error;
+ (BOOL)writeFile:(NSString *)filename toDocumentFolderWithContent:(NSString *)content error:(NSError **)error;

+(NSURL*)documentUrl;

+(NSString *)filepathInDocumentFolderWithFilename:(NSString *)filename;

@end