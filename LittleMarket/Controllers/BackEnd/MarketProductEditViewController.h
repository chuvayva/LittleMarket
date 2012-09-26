//
//  MarketProductEditViewController.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <UIKit/UIKit.h>
#import "Product.h"


@protocol MarketProductEditViewControllerDelegate;

@interface MarketProductEditViewController : UITableViewController
<UITextFieldDelegate>

@property (weak, nonatomic) id<MarketProductEditViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *productName;

@property (weak, nonatomic) IBOutlet UITextField *productCategory;

@property (weak, nonatomic) IBOutlet UITextField *productPrice;

@property (weak, nonatomic) IBOutlet UITextField *productQuality;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (copy, nonatomic) Product* editedProduct;

- (IBAction)doneClicked:(id)sender;

- (IBAction)cancelClicked:(id)sender;

- (IBAction)anyTextFieldChanged:(UITextField *)sender;

@end



@protocol MarketProductEditViewControllerDelegate <NSObject>

-(void) addProduct: (Product*) newProduct;

-(void) replaceOldProduct: (Product*) oldProduct withNewProduct: (Product*) newProduct;

-(void) addProductDidClose;

@end



typedef enum
{
    EditMode,
    AddMode
} ProductEditMode;




