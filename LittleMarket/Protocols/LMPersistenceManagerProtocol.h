//
//  LMDataModelManagerProtocol.h
//  LittleMarket
//
//  Created by BiT on 04.10.12.
//
//

#import <Foundation/Foundation.h>
@protocol LMPersisterProtocol;
@class LMDataModel;


@protocol LMPersistenceManagerProtocol <NSObject>

@property (nonatomic, strong) id<LMPersisterProtocol> persister;

-(void)saveModel: (LMDataModel *)dataModel;

-(LMDataModel *)loadModel;

@end
