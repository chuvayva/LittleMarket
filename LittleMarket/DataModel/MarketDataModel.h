//
// Created by chuvayva on 21.09.12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface MarketDataModel : NSObject

@property (nonatomic) NSMutableArray *availableProducts;

@property (nonatomic) NSMutableArray *cartProducts;

- (id)initWithAvailableProducts:(NSArray *)availableProducts andCartProducts:(NSArray *)cartProducts;

- (id)initWithAvailableProducts:(NSArray *)availableProducts;


@end