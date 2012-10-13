
//  MarketDataModelManager.m
//  LittleMarket
//
//  Created by BiT on 18.08.12.
//
//

#import "MarketDataModelManager.h"

#import "MarketDataModel.h"


@interface MarketDataModelManager ()

-(Product*)getFirstProductInArray: (NSArray*)products byProductType: (ProductType*) type;

-(void)moveProduct: (Product*)product from:(NSMutableArray*)fromList to:(NSMutableArray*)toList;

@end



@implementation MarketDataModelManager

-(id) init
{
    self = [super init];
    
    if(self)
    {
        _dataModel = [MarketDataModel new];
    }
    
    return self;
}

-(void)setDataModel:(MarketDataModel *)dataModel
{
    _dataModel = dataModel;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:AvailableProductsChanged object:self userInfo:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CartProductsChanged object:self userInfo:nil];
}

#pragma mark MarketStoreFrontDataModel

-(NSUInteger)availableProductsCount
{
    return _dataModel.availableProducts.count;
}

-(Product*) availableProductAtIndex: (NSUInteger) index
{
    return (Product*)[_dataModel.availableProducts objectAtIndex:index];
}


-(void)sentToCartProduct: (Product*) product
{
    [self moveProduct:product from:_dataModel.availableProducts to:_dataModel.cartProducts];
    
    [NSThread sleepForTimeInterval: 3]; // for multithreading testing
}
#pragma mark MarketBackEndDataModel

-(void) removeAvailableProductAtIndex: (NSUInteger) index
{
     [_dataModel.availableProducts removeObjectAtIndex:index];

    [[NSNotificationCenter defaultCenter] postNotificationName:AvailableProductsChanged object:self userInfo:nil];
}

-(void) addAvailableProduct: (Product*) product
{
    [NSThread sleepForTimeInterval:5]; // for multithreading testing
    
    NSUInteger newIndex = [_dataModel.availableProducts indexOfObject:product
                                  inSortedRange:(NSRange){0, [_dataModel.availableProducts count]}
                                        options:NSBinarySearchingInsertionIndex
                                usingComparator: ^NSComparisonResult(Product *product1, Product *product2) {
                                    return [product1 compare:product2];
                                }];

    [_dataModel.availableProducts insertObject:product atIndex:newIndex];

    [[NSNotificationCenter defaultCenter] postNotificationName:AvailableProductsChanged object:self userInfo:nil];
}

-(void) replaceOldAvailableProduct: (Product*) oldProduct withNewProduct: (Product*) newProduct
{
    [_dataModel.availableProducts removeObject:oldProduct];

    [self addAvailableProduct:newProduct];
}

#pragma mark MarketCartTableModel

-(NSUInteger) cartProductsCount
{
    return [_dataModel.cartProducts count];
}

-(Product*) cartProductAtIndex: (NSUInteger) index
{
    return [_dataModel.cartProducts objectAtIndex:index];
}


-(void)buyAllProducts
{
    //[NSThread sleepForTimeInterval:3]; // for multithreading testing
    
    [_dataModel.cartProducts removeAllObjects];

    [[NSNotificationCenter defaultCenter] postNotificationName:CartProductsChanged object:self userInfo:nil];

    [[[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"Products are bought" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

-(void)buyProductAtIndex: (NSUInteger) index
{
    //[NSThread sleepForTimeInterval:3]; // for multithreading testing
    
    Product *buyingProduct = [_dataModel.cartProducts objectAtIndex:index];

    [_dataModel.cartProducts removeObject:buyingProduct];

    NSString *message = [NSString stringWithFormat:@"Product are bought:\n %@", [buyingProduct description]];
    [[[UIAlertView alloc] initWithTitle:@"Congratulations" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];

    [[NSNotificationCenter defaultCenter] postNotificationName:CartProductsChanged object:self userInfo:nil];
}

-(void)returnCartProductAtIndex: (NSUInteger) index
{
    Product *returningProduct = [[_dataModel.cartProducts objectAtIndex:index] copy];

    [self moveProduct:returningProduct from:_dataModel.cartProducts to:_dataModel.availableProducts];
}

#pragma mark Private Methods

-(Product*) getFirstProductInArray: (NSMutableArray*)products byProductType: (ProductType*) type
{
    // TODO: Find another way for filtering
    for(Product* item in products)
    {
        if ([[item productType] isEqual: type])
        {
            return item;
        }
    }

    return nil;
}

-(void)moveProduct:(Product *)product from:(NSMutableArray *)fromList to:(NSMutableArray *)toList
{
    Product *findedProductInFromList = [self getFirstProductInArray:fromList
                                                 byProductType: [product productType]];

    if (!findedProductInFromList) return;
//        @throw [NSException exceptionWithName:@"ArgumentException" reason:@"Product not found" userInfo:NULL];

    if (findedProductInFromList.number < product.number)
        @throw [NSException exceptionWithName:@"ArgumentException" reason:@"Products is not enough" userInfo:NULL];


    findedProductInFromList.number -= product.number;

    if(findedProductInFromList.number == 0)
        [fromList removeObject:findedProductInFromList];

    Product *findedProductInToList = [self getFirstProductInArray:toList
                                                byProductType: [product productType]];

    if (findedProductInToList)
    {
        findedProductInToList.number += product.number;
    }
    else
    {
        // Упорядоченное добавление
        NSUInteger newIndex = [toList indexOfObject:product
                                     inSortedRange:(NSRange){0, [toList count]}
                                           options:NSBinarySearchingInsertionIndex
                                    usingComparator: ^NSComparisonResult(Product *product1, Product *product2) {
                                        return [product1 compare:product2];
                                    }];

        [toList insertObject:product atIndex:newIndex];
    }

    [[NSNotificationCenter defaultCenter] postNotificationName:AvailableProductsChanged object:self userInfo:nil];

    [[NSNotificationCenter defaultCenter] postNotificationName:CartProductsChanged object:self userInfo:nil];
}

@end
