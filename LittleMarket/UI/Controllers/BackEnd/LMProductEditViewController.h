//
//  LMProductEditViewController.h
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import <UIKit/UIKit.h>
#import "LMProduct.h"


@protocol MarketProductEditViewControllerDelegate;

@interface LMProductEditViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UITextField *productCategory;
@property (weak, nonatomic) IBOutlet UITextField *productPrice;
@property (weak, nonatomic) IBOutlet UITextField *productQuality;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@property (weak, nonatomic) id<MarketProductEditViewControllerDelegate> delegate;
@property (copy, nonatomic) LMProduct * editedProduct;

- (IBAction)doneClicked:(id)sender;
- (IBAction)cancelClicked:(id)sender;
- (IBAction)anyTextFieldChanged:(UITextField *)sender;

@end



@protocol MarketProductEditViewControllerDelegate <NSObject>

-(void) addProduct: (LMProduct *) newProduct;
-(void) replaceOldProduct: (LMProduct *) oldProduct withNewProduct: (LMProduct *) newProduct;
-(void) addProductDidClose;

@end



typedef enum
{
    EditMode,
    AddMode
} ProductEditMode;




