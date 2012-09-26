//
//  NSMutableArray+Query.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Query)

-(NSMutableArray*)where:(id (^)(id))predicate;

@end
