//
//  LMDataModelManager.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>
#import "LMStoreFrontModel.h"
#import "LMBackEndModel.h"
#import "LMCartTableModel.h"
#import "LMDataModelManagerProtocol.h"
#import "LMBuyProductDelegate.h"

@class LMDataModel;


@interface LMDataModelManager : NSObject <LMStoreFrontModel, LMBackEndModel, LMCartTableModel, LMDataModelManagerProtocol>

@property (nonatomic) LMDataModel *dataModel;

@end
