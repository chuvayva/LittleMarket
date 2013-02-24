//
//  LMConstants.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>

@interface LMConstants : NSObject

// Notification keys //

FOUNDATION_EXPORT NSString *const AvailableProductsChanged;

FOUNDATION_EXPORT NSString *const CartProductsChanged;

// Common persister keys //

FOUNDATION_EXPORT NSString *const CartProductsKey;

FOUNDATION_EXPORT NSString *const AvailableProductsKey;

FOUNDATION_EXPORT NSString *const ProductTypeKey;

FOUNDATION_EXPORT NSString *const ProductTypeNameKey;

FOUNDATION_EXPORT NSString *const ProductTypeCategoryKey;

FOUNDATION_EXPORT NSString *const ProductTypePriceKey;

FOUNDATION_EXPORT NSString *const ProductQuantityKey;

// Json keys //

FOUNDATION_EXPORT NSString *const JsonFileName;

// Archive //

FOUNDATION_EXPORT NSString *const ArchiveFileName;


@end
