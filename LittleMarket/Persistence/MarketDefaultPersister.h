//
//  ProductListInitializer.h
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarketPersisterProtocol.h"

@interface MarketDefaultPersister : NSObject <MarketPersisterProtocol>

+ (id <MarketPersisterProtocol>)single;

@end
