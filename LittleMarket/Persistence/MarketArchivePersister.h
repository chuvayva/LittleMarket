//
//  MarketArchivePersister.h
//  LittleMarket
//
//  Created by BiT on 09.10.12.
//
//

#import <Foundation/Foundation.h>
#import "MarketPersisterProtocol.h"

@interface MarketArchivePersister : NSObject <MarketPersisterProtocol>

- (id)initWithFilepath:(NSString *)filepath;

@property (nonatomic) NSString *filepath;

@end
