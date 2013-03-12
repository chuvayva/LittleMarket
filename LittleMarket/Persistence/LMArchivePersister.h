//
//  LMArchivePersister.h
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import <Foundation/Foundation.h>
#import "LMPersisterProtocol.h"

@interface LMArchivePersister : NSObject <LMPersisterProtocol>

@property (nonatomic) NSString *filepath;

- (id)initWithFilepath:(NSString *)filepath;

@end
