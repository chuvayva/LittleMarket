//
// Created by chuvayva on 25.09.12.
//


#import <Foundation/Foundation.h>


@interface MarketFileManager : NSObject

+ (NSString *)readFileFromDocumentFolder:(NSString *)filename error:(NSError **)error;

+ (BOOL)writeFile:(NSString *)filename ToDocumentFolderWithContent:(NSString *)content error:(NSError **)error;

+(NSURL*)documentUrl;

@property (nonatomic) NSString *filename;

@end