//
//  LMArchivePersister.m
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import "LMArchivePersister.h"
#import "LMFileManager.h"
#import "LMDataModel.h"

@implementation LMArchivePersister

#pragma mark - Inits

- (id)initWithFilepath:(NSString *)filepath
{
    if (!(self = [super init])) return nil;
    
    
    _filepath = filepath;
    
    
    return self;
}

-(id) init
{
    NSString *archivefilePath = [LMFileManager filepathInDocumentFolderWithFilename:ArchiveFileName] ;
    return [self initWithFilepath:archivefilePath];
}


#pragma mark - MarketPersistentProtocol

- (void)saveModel:(LMDataModel *)dataModel
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:dataModel];
    [encodedObject writeToFile:self.filepath atomically:YES];
}

- (LMDataModel *)loadModel
{
    LMDataModel * decodedObject = [NSKeyedUnarchiver unarchiveObjectWithFile:self.filepath];
    
    return decodedObject ? decodedObject : [LMDataModel new];
}


@end
