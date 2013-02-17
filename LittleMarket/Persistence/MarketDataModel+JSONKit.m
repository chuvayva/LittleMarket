//
// Created by chuvayva on 22.09.12.
//


#import "MarketDataModel+JSONKit.h"
#import "Product.h"
#import "JSONKit.h"


@implementation MarketDataModel (JSONKit)

+ (MarketDataModel *)fromJSONString:(NSString *)jsonString
{
    NSArray *availableProducts, *cartProducts;
    
    NSDictionary *dictionary = [jsonString objectFromJSONString];  // JSONKit parsing
    if (dictionary)
    {
        availableProducts = [self createProducts:[dictionary objectForKey:AvailableProductsKey]];
        cartProducts = [self createProducts:[dictionary objectForKey:CartProductsKey]];
    }
    
    return [[MarketDataModel alloc] initWithAvailableProducts: availableProducts andCartProducts:cartProducts];
}

- (NSString *)JSONString
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


+(Product*)createProduct:(id)object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        id productTypeData = [dictionary objectForKey:ProductTypeKey];
        ProductType *productType = [self createProductType:productTypeData];

        NSUInteger quantity = (NSUInteger)[[dictionary objectForKey:ProductQuantityKey] integerValue];

        return [[Product alloc] initWithProductType:productType andQuantity:quantity];
    }

    return nil;
}

+(ProductType *)createProductType: (id) object
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = (NSDictionary *)object;

        NSString *name = [dictionary objectForKey:ProductTypeNameKey];
        NSString *category = [dictionary objectForKey:ProductTypeCategoryKey];
        double price = [[dictionary objectForKey:ProductTypePriceKey] doubleValue];

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
        [jsonObject setValue:[self jsonObjectFromProductType:product.productType] forKey:ProductTypeKey];
        [jsonObject setValue:[NSNumber numberWithInteger:product.number] forKey:ProductQuantityKey];
    }
    
    return jsonObject;
}

-(NSDictionary*)jsonObjectFromProductType:(ProductType*) productType
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