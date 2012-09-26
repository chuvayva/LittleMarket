//
// Created by chuvayva on 20.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MarketJsonPersister.h"
#import "MarketDataModel.h"
#import "MarketDataModel+JSONKit.h"


@interface MarketJsonPersister ()

- (NSString *)filepathInDocumentFolderByFilename:(NSString *)filename;


@end

@implementation MarketJsonPersister

@synthesize jsonFilepath = _jsonFilepath;

#pragma mark Inits

- (id)initWithFilepath:(NSString *)filepath
{
    self = [super init];
    if (self)
    {
        if (![[NSFileManager defaultManager] fileExistsAtPath:filepath])
            NSLog(@"filepath not found");

        _jsonFilepath = filepath;
    }

    return self;
}

-(id) init
{
    NSString *jsonfilePath = [self filepathInDocumentFolderByFilename:JsonFileName] ;
    return [self initWithFilepath:jsonfilePath];
}

#pragma mark MarketPersistentProtocol

- (void)saveModel:(MarketDataModel *)dataModel
{
     // TODO: next time
}

- (MarketDataModel *)loadModel
{
    NSString *jsonString = [NSString stringWithContentsOfFile:self.jsonFilepath encoding:NSUTF8StringEncoding error:nil];

    return [MarketDataModel fromJSONString:jsonString];
}


-(NSString *)filepathInDocumentFolderByFilename:(NSString *)filename
{
    NSArray *documentsUrls = [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];

    return [[[documentsUrls objectAtIndex:0] URLByAppendingPathComponent:filename] path];
}


@end