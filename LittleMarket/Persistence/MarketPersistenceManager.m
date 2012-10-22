//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MarketPersistenceManager.h"
#import "MarketPersisterProtocol.h"
#import "MarketDataModel.h"


@implementation MarketPersistenceManager

@synthesize persister = injPersister; // auto injecting from IOC contaner

-(void)saveModel: (MarketDataModel*)dataModel
{
    [self.persister saveModel:dataModel];
}

-(MarketDataModel*) loadModel
{
    return [self.persister loadModel];
}

@end