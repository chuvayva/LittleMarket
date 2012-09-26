//
//  Constants.h
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

// Notification keys //

FOUNDATION_EXPORT NSString *const AvailableProductsChanged;

FOUNDATION_EXPORT NSString *const CartProductsChanged;

// Json keys //

FOUNDATION_EXPORT NSString *const JsonFileName;

//FOUNDATION_EXPORT NSString *const JsonResourceFileExtension;

FOUNDATION_EXPORT NSString *const JsonCartProductsKey;

FOUNDATION_EXPORT NSString *const JsonAvailableProductsKey;

FOUNDATION_EXPORT NSString *const JsonProductTypeKey;

FOUNDATION_EXPORT NSString *const JsonProductTypeNameKey;

FOUNDATION_EXPORT NSString *const JsonProductTypeCategoryKey;

FOUNDATION_EXPORT NSString *const JsonProductTypePriceKey;

FOUNDATION_EXPORT NSString *const JsonProductQuantityKey;


@end
