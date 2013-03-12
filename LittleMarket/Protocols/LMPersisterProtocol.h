//
//  LMPersisterProtocol.h
//  LittleMarket
//
//  Created by BiT on 13.08.12.
//
//

#import <Foundation/Foundation.h>

@class LMDataModel;

@protocol LMPersisterProtocol <NSObject>

-(void)saveModel: (LMDataModel *)dataModel;

-(LMDataModel *)loadModel;

@end
