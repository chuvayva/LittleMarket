//
// Created by chuvayva on 22.09.12.
//


#import "MarketDataModel+JSONKit.h"
#import "Product.h"
#import "JSONKit.h"


//@interface MarketDataModel ()
//
//+ (NSArray *)createProducts:(id)object;
//
//+ (Product *)createProduct:(id)object;
//
//+ (ProductType *)createProductType:(id)object;
//
//
//@end



@implementation MarketDataModel (JSONKit)

+ (MarketDataModel *)fromJSONString:(NSString *)jsonString
{
    NSDictionary *dictionary = [jsonString objectFromJSONString];  // JSONKit parsing

    NSArray *availableProducts = [self createProducts:[dictionary objectForKey:JsonAvailableProductsKey]];
    NSArray *cartProducts = [NSMutableArray array];//[self createProducts:[dictionary objectForKey:JsonCartProductsKey]];

    return [[MarketDataModel alloc] initWithAvailableProducts: availableProducts andCartProducts:cartProducts];
}

- (NSString *)JSONString
{
    return nil;
}

#pragma mark Private methods

+(NSArray *)createProducts:(id)object
{
    if (![object isKindOfClass:[NSArray class]])
        @throw [NSException exceptionWithName:@"ArgumentException" reason:@"object is not a NSArray" userInfo:nil];

    NSArray *productsData = (NSArray *)object;
    NSMutableArray *resultProducts = [NSMutableArray array];

    for(id object in productsData)
        [resultProducts addObject:[self createProduct:object]];

    return resultProducts;
}


+(Product*)createProduct:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        id productTypeData = [dictionary objectForKey:JsonProductTypeKey];
        ProductType *productType = [self createProductType:productTypeData];

        NSUInteger quantity = (NSUInteger)[[dictionary objectForKey:JsonProductQuantityKey] integerValue];

        return [[Product alloc] initWithProductType:productType andQuantity:quantity];
    }

    return nil;
}

+(ProductType *)createProductType: (id) object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        NSString *name = [dictionary objectForKey:JsonProductTypeNameKey];
        NSString *category = [dictionary objectForKey:JsonProductTypeCategoryKey];
        double price = [[dictionary objectForKey:JsonProductTypePriceKey] doubleValue];

        return [[ProductType alloc] initWithName:name category:category price:price];
    }

    return nil;
}

//-(NSArray *)jsonObjectFromProducts: (NSArray *)

@end