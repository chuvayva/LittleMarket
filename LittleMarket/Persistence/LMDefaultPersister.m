//
//  ProductListInitializer.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LMDefaultPersister.h"
#import "LMProduct.h"
#import "dispatch/once.h"
#import "LMDataModel.h"

@interface LMDefaultPersister ()
- (NSArray *)createProducts;

@end

@implementation LMDefaultPersister

//
//
//+(id<LMPersisterProtocol>) single
//{
//    static LMDefaultPersister *single;
//    static dispatch_once_t predicate;
//
//    dispatch_once(&predicate, ^{
//    single = [self new];
//});
//
//    return  single;
//}

-(NSArray*)createProducts
{
    NSMutableArray *result = [NSMutableArray array];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Plantronics Discovery 975"
                category:@"Bluetooth-гарнитуры"
                   price:1999
                  number:2]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Jabra STONE2"
                category:@"Bluetooth-гарнитуры"
                   price:3099
                  number:1]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Jawbone ICON"
                category:@"Bluetooth-гарнитуры"
                   price:5190
                  number:4]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Адаптер для Apple iPhone 3G HAMA"
                category:@"Аксессуары"
                   price:650
                  number:2]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Переходник для наушников 2.5 на 3.5"
                category:@"Аксессуары"
                   price:420
                  number:1]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Аккумулятор для Apple iPad внешний Mipow Power Tube 4400"
                category:@"Аксессуары"
                   price:2090
                  number:3]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Чехол для сотового телефона APPLE GB01694"
                category:@"Аксессуары"
                   price:1361
                  number:2]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Apple iPhone 4S 16Gb"
                category:@"Сотовые телефоны"
                   price:24990
                  number:3]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Samsung Galaxy Note N7000"
                category:@"Сотовые телефоны"
                   price:26900
                  number:1]];

    [result addObject: [[LMProduct alloc]
            initWithName:@"Samsung Galaxy S III 16Gb"
                category:@"Сотовые телефоны"
                   price:25390
                  number:4]];

    return result;
}

#pragma mark - MarketPersistentProtocol

- (void)saveModel:(LMDataModel *)dataModel
{
    // I can't save
}

- (LMDataModel *)loadModel
{
    NSArray *availableProducts = [self createProducts];
    return [[LMDataModel alloc] initWithAvailableProducts: availableProducts];
}


@end
