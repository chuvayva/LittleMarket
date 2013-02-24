//
//  MarketProductEditViewController.m
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import "MarketProductEditViewController.h"

@interface MarketProductEditViewController ()

-(BOOL)isInputDataCorrect;

-(void)done;

-(ProductEditMode)mode;

- (void)configureView;

@end


@implementation MarketProductEditViewController

@synthesize doneButton = _doneButton;
@synthesize editedProduct = _editedProduct;

-(void)setEditedProduct:(Product *)editedProduct
{
    _editedProduct = editedProduct;
    
    [self configureView];
}

#pragma mark - Overrides

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self configureView];
}

- (void)viewDidUnload
{
    self.productName = nil;
    self.productCategory = nil;
    self.productPrice = nil;
    self.productQuality = nil;
    [self setDoneButton:nil];
    [super viewDidUnload];
}

-(BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark - IBActions

- (IBAction)doneClicked:(id)sender
{
    if ([self isInputDataCorrect])
        [self done];
}

- (IBAction)cancelClicked:(id)sender
{
    [self.delegate addProductDidClose];
}

- (IBAction)anyTextFieldChanged:(UITextField *)sender
{
    self.doneButton.enabled = [self isInputDataCorrect];
}

#pragma mark - Private Methods

-(BOOL)isInputDataCorrect
{
    return (self.productName.text.length && self.productPrice.text.length && self.productQuality.text.length && self.productCategory.text.length);
}

-(void)done
{
    Product *newProduct = [[Product alloc]initWithName:self.productName.text category:self.productCategory.text price:  [self.productPrice.text doubleValue] number:[self.productQuality.text integerValue]];
    
    if ([self mode] == AddMode)
    {
        [self.delegate addProduct:newProduct];
    }
    else
    {
        [self.delegate replaceOldProduct:self.editedProduct withNewProduct:newProduct];
        self.editedProduct = nil;
    }
}

-(ProductEditMode)mode
{
    return self.editedProduct == nil ? AddMode : EditMode;
}

- (void)configureView
{
    if(self.editedProduct)
    {
        self.productName.text = self.editedProduct.productType.name;
        self.productCategory.text = self.editedProduct.productType.category;
        self.productPrice.text = [NSString stringWithFormat:@"%d", (int)self.editedProduct.productType.price];
        self.productQuality.text = [NSString stringWithFormat:@"%d", (int)self.editedProduct.number];
    }
}
#pragma mark - UITableViewDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.productQuality)
    {
        if ([self isInputDataCorrect])
            [self done];
        else
            [textField resignFirstResponder];
    }
    else
    {
        NSInteger nextViewTag = [textField tag] + 1;
        UIView *nextFocusView = [self.view viewWithTag:nextViewTag];
        [nextFocusView becomeFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGPoint newPoint = CGPointMake(0, textField.superview.superview.frame.origin.y - 46);
    [self.tableView setContentOffset:newPoint animated:YES];
   
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // Input control for double value of product price
    if (textField == self.productPrice)
    {
        NSString *resultingString = [textField.text stringByReplacingCharactersInRange: range withString: string];
        
        // The user deleting all input is perfectly acceptable.
        if ([resultingString length] == 0)
            return YES;
        
            
        double result;
        
        NSScanner *scan = [NSScanner scannerWithString: resultingString];
        
        return [scan scanDouble: &result] && [scan isAtEnd];
    }
    
    return YES;
}

@end
