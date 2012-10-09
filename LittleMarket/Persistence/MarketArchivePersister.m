//
//  MarketArchivePersister.m
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import "MarketArchivePersister.h"
#import "MarketFileManager.h"
#import "MarketDataModel.h"

@implementation MarketArchivePersister

#pragma mark Inits

- (id)initWithFilepath:(NSString *)filepath
{
    self = [super init];
    if (self)
    {
        _filepath = filepath;
    }
    
    return self;
}

-(id) init
{
    NSString *archivefilePath = [MarketFileManager filepathInDocumentFolderWithFilename:ArchiveFileName] ;
    return [self initWithFilepath:archivefilePath];
}


#pragma mark MarketPersistentProtocol

- (void)saveModel:(MarketDataModel *)dataModel
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:dataModel];
    [encodedObject writeToFile:self.filepath atomically:YES];
}

- (MarketDataModel *)loadModel
{
    MarketDataModel* decodedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filepath];
    
    return decodedObject ? decodedObject : [MarketDataModel new];
}


@end
