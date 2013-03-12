//
// Created by chuvayva on 20.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
#import "LMPersisterProtocol.h"


@interface LMJsonPersister : NSObject <LMPersisterProtocol>

@property (nonatomic) NSString *jsonFilepath;

- (id)initWithFilepath:(NSString *)filepath;
- (id)init;

@end