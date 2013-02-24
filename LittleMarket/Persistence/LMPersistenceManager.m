//
// Created by chuvayva on 19.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "LMPersistenceManager.h"
#import "LMPersisterProtocol.h"
#import "LMDataModel.h"


@implementation LMPersistenceManager

@synthesize persister = injPersister; // auto injecting from IOC contaner

-(void)saveModel: (LMDataModel *)dataModel
{
    [self.persister saveModel:dataModel];
}

-(LMDataModel *) loadModel
{
    return [self.persister loadModel];
}

@end