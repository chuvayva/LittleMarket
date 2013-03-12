//
// Created by chuvayva on 22.09.12.
//


#import "LMDataModel+JsonKit.h"
#import "LMProduct.h"
#import "JSONKit.h"


@implementation LMDataModel (JsonKit)

+ (LMDataModel *)fromJsonString:(NSString *)jsonString
{
    NSArray *availableProducts, *cartProducts;
    
    NSDictionary *dictionary = [jsonString objectFromJSONString];  // JSONKit parsing
    if (dictionary)
    {
        availableProducts = [self createProducts:[dictionary objectForKey:AvailableProductsKey]];
        cartProducts = [self createProducts:[dictionary objectForKey:CartProductsKey]];
    }
    
    return [[LMDataModel alloc] initWithAvailableProducts: availableProducts andCartProducts:cartProducts];
}

- (NSString *)jsonString
{
    NSArray *availableProductsJsonObjects = [self jsonObjectFromProducts:self.availableProducts];
    NSArray *cartProductsJsonObjects = [self jsonObjectFromProducts:self.cartProducts];
    
    NSDictionary *jsonDataModelDictionary = @{AvailableProductsKey : availableProductsJsonObjects, CartProductsKey:cartProductsJsonObjects};
    
    return [jsonDataModelDictionary JSONString];
}



#pragma mark - Private methods

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


+(LMProduct *)createProduct:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        id productTypeData = [dictionary objectForKey:ProductTypeKey];
        LMProductType *productType = [self createProductType:productTypeData];

        NSUInteger quantity = (NSUInteger)[[dictionary objectForKey:ProductQuantityKey] integerValue];

        return [[LMProduct alloc] initWithProductType:productType andQuantity:quantity];
    }

    return nil;
}

+(LMProductType *)createProductType: (id) object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        NSString *name = [dictionary objectForKey:ProductTypeNameKey];
        NSString *category = [dictionary objectForKey:ProductTypeCategoryKey];
        double price = [[dictionary objectForKey:ProductTypePriceKey] doubleValue];

        return [[LMProductType alloc] initWithName:name category:category price:price];
    }

    return nil;
}

-(NSArray *)jsonObjectFromProducts: (NSArray *) products
{
    NSMutableArray *jsonObjects = [NSMutableArray array];
    
    if (products)
    {
        for (LMProduct *product in products)
            [jsonObjects addObject:[self jsonObjectFromProduct:product]];
    }
    
    return jsonObjects;
}

-(NSDictionary*)jsonObjectFromProduct: (LMProduct *)product
{
    NSDictionary *jsonObject = [NSMutableDictionary dictionary];
    
    if (product)
    {
        [jsonObject setValue:[self jsonObjectFromProductType:product.productType] forKey:ProductTypeKey];
        [jsonObject setValue:[NSNumber numberWithInteger:product.number] forKey:ProductQuantityKey];
    }
    
    return jsonObject;
}

-(NSDictionary*)jsonObjectFromProductType:(LMProductType *) productType
{
    NSDictionary *jsonObject = [NSMutableDictionary dictionary];
    
    if (productType)
    {
        [jsonObject setValue:productType.name forKey:ProductTypeNameKey];
        [jsonObject setValue:productType.category forKey:ProductTypeCategoryKey];
        [jsonObject setValue:[NSNumber numberWithDouble:productType.price] forKey:ProductTypePriceKey];
    }
    
    return jsonObject;
}

@end