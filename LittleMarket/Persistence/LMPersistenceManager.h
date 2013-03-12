//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "LMPersistenceManagerProtocol.h"

@protocol LMPersisterProtocol;


@interface LMPersistenceManager : NSObject <LMPersistenceManagerProtocol>

@property (nonatomic, strong) id<LMPersisterProtocol> persister;

@end