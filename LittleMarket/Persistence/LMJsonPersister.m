//
// Created by chuvayva on 20.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LMJsonPersister.h"
#import "LMDataModel.h"
#import "LMDataModel+JSONKit.h"


@interface LMJsonPersister ()

- (NSString *)filepathInDocumentFolderWithFilename:(NSString *)filename;


@end

@implementation LMJsonPersister

#pragma mark - Inits

- (id)initWithFilepath:(NSString *)filepath
{
    if (!(self = [super init])) return nil;
    
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filepath])
        NSLog(@"file not found");
    
    _jsonFilepath = filepath;   

    return self;
}

-(id) init
{
    NSString *jsonfilePath = [self filepathInDocumentFolderWithFilename:JsonFileName] ;
    return [self initWithFilepath:jsonfilePath];
}

#pragma mark - MarketPersistentProtocol

- (void)saveModel:(LMDataModel *)dataModel
{
    NSString *jsonString = [dataModel JSONString];
    [jsonString writeToFile:self.jsonFilepath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (LMDataModel *)loadModel
{
    NSString *jsonString = [NSString stringWithContentsOfFile:self.jsonFilepath encoding:NSUTF8StringEncoding error:nil];

    return [LMDataModel fromJSONString:jsonString];
}

#pragma mark - Private

-(NSString *)filepathInDocumentFolderWithFilename:(NSString *)filename
{
    NSArray *documentsUrls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];

    return [[[documentsUrls objectAtIndex:0] URLByAppendingPathComponent:filename] path];
}


@end