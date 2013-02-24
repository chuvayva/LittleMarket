//
//  LMConstants.m
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import "LMConstants.h"

@implementation LMConstants

// Notification keys //

NSString *const AvailableProductsChanged = @"AvailableProductsChanged";

NSString *const CartProductsChanged = @"CartProductsChanged";

// Common Persister Keys

NSString *const CartProductsKey = @"cartProducts";

NSString *const AvailableProductsKey = @"availableProducts";

NSString *const ProductTypeKey = @"productType";

NSString *const ProductTypeNameKey = @"name";

NSString *const ProductTypeCategoryKey = @"category";

NSString *const ProductTypePriceKey = @"price";

NSString *const ProductQuantityKey = @"quantity";

// Json keys //

NSString *const JsonFileName = @"LittleMarketData.json";

// Archive //

NSString *const ArchiveFileName = @"LittleMarketData.dat";

@end
