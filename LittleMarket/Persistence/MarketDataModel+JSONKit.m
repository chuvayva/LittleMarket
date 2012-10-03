//
// Created by chuvayva on 22.09.12.
//


#import "MarketDataModel+JSONKit.h"
#import "Product.h"
#import "JSONKit.h"


@implementation MarketDataModel (JSONKit)

+ (MarketDataModel *)fromJSONString:(NSString *)jsonString
{
    NSDictionary *dictionary = [jsonString objectFromJSONString];  // JSONKit parsing
    NSArray *availableProducts, *cartProducts;
    
    if (dictionary)
    {
        availableProducts = [self createProducts:[dictionary objectForKey:JsonAvailableProductsKey]];
        cartProducts = [self createProducts:[dictionary objectForKey:JsonCartProductsKey]];
    }
    
    return [[MarketDataModel alloc] initWithAvailableProducts: availableProducts andCartProducts:cartProducts];
}

- (NSString *)JSONString
{
    NSArray *availableProductsJsonObjects = [self jsonObjectFromProducts:self.availableProducts];
    NSArray *cartProductsJsonObjects = [self jsonObjectFromProducts:self.cartProducts];
    
    NSDictionary *jsonDataModelDictionary = @{JsonAvailableProductsKey : availableProductsJsonObjects, JsonCartProductsKey:cartProductsJsonObjects};
    
    return [jsonDataModelDictionary JSONString];
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

-(NSArray *)jsonObjectFromProducts: (NSArray *) products
{
    NSMutableArray *jsonObjects = [NSMutableArray array];
    
    if (products)
    {
        for (Product *product in products)
            [jsonObjects addObject:[self jsonObjectFromProduct:product]];
    }
    
    return jsonObjects;
}

-(NSDictionary*)jsonObjectFromProduct: (Product*)product
{
    NSDictionary *jsonObject = [NSMutableDictionary dictionary];
    
    if (product)
    {
        [jsonObject setValue: [self jsonObjectFromProductType:product.productType] forKey:JsonProductTypeKey];
        [jsonObject setValue: [NSNumber numberWithInteger: product.number] forKey:JsonProductQuantityKey];
    }
    
    return jsonObject;
}

-(NSDictionary*)jsonObjectFromProductType:(ProductType*) productType
{
    NSDictionary *jsonObject = [NSMutableDictionary dictionary];
    
    if (productType)
    {
        [jsonObject setValue:productType.name forKey:JsonProductTypeNameKey];
        [jsonObject setValue:productType.category forKey:JsonProductTypeCategoryKey];
        [jsonObject setValue:[NSNumber numberWithDouble:productType.price]forKey:JsonProductTypePriceKey];
    }
    
    return jsonObject;
}

@end