//
//  NSMutableArray+Query.m
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import "NSMutableArray+Query.h"

@implementation NSMutableArray (Query)

- (id) where:(id (^)(id))predicate
{
    NSMutableArray * retval = [NSMutableArray array];
    for (id item in self) {
        if (predicate(item)) { [retval addObject:item]; }
    }
    return retval;
}

@end
