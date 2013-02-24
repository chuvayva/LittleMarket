//
//  MarketDetailViewController.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MarketDetailTableViewController.h"
#import "Product.h"

@interface MarketDetailTableViewController ()
- (void)configureView;

-(void)dismissKeyboard;
@end

@implementation MarketDetailTableViewController

@synthesize product = _product;
@synthesize buyNumber = _buyNumber;

@synthesize buttonBuy = _buttonbuy;

@synthesize labelProductName = _productName;
@synthesize labelProductCategory = _productCategory;
@synthesize labelProductPrice = _productPrice;
@synthesize labelProductNumber = _productNumber;
@synthesize textFieldBuyNumber = _textFieldBuyNumber;
@synthesize stepperMinMaxProduct = _MinMaxProductStepper;


#pragma mark - - Model

-(void)setProduct:(Product *)product
{
    _product = [product copy];
    
    [self configureView];
}

-(void) setBuyNumber: (NSUInteger) value
{
    if (_buyNumber != value)
    {
        _buyNumber = value;
        
       // self.textFieldBuyNumber.text = [NSString stringWithFormat:@"%d", value];
        self.stepperMinMaxProduct.value = value;
        
        self.buttonBuy.enabled = (value != 0);
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)viewDidUnload
{    
    [self setLabelProductName:nil];
    [self setLabelProductCategory:nil];
    [self setLabelProductPrice:nil];
    [self setLabelProductNumber:nil];
    [self setStepperMinMaxProduct:nil];
    [self setButtonBuy:nil];
    [self setTextFieldBuyNumber:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    if (interfaceOrientation == UIInterfaceOrientationPortrait)
//    {
//        self.labelbuyNumber.frame = CGRectMake(79, 16, 42, 21);
//        self.stepperMinMaxProduct.frame = CGRectMake(129, 13, 94, 27);
//        self.buttonBuy.frame = CGRectMake(20, 51, 260, 37);
//        self.buttonBuy.superview.frame = CGRectMake(0,207, 320,  101);
//    }
//    else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight)
//    {
//        self.labelbuyNumber.frame = CGRectMake(66, 12, 42, 21);
//        self.stepperMinMaxProduct.frame = CGRectMake(122, 9, 94, 27);
//        self.buttonBuy.frame = CGRectMake(224, 4, 171, 37);
//        self.buttonBuy.superview.frame = CGRectMake(0,207, 480 ,  47);
//    }
    
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)iWandBuyIt
{
    Product *boughtProduct = [[Product alloc] initWithProductType:self.product.productType andQuantity:self.buyNumber];
    [NSThread detachNewThreadSelector:@selector(sentToCartProduct:) toTarget:self.delegate withObject:boughtProduct];
    
    self.product.number -= self.buyNumber;
    
    if (self.product.number == 0)
        [self.navigationController popViewControllerAnimated:YES];
    else [self configureView];    

//    [self.delegate sentToCartProduct:boughtProduct];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)ProductbuyNumberChanged:(UIStepper *)sender
{
    self.buyNumber = sender.value;
    self.textFieldBuyNumber.text = [NSString stringWithFormat:@"%d", (NSUInteger)sender.value];
}

#pragma mark - UITextFieldDelegate

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
     NSString *resultingString = [textField.text stringByReplacingCharactersInRange: range withString: string];
    
    if ([resultingString length] == 0)
    {
        self.buyNumber = 0;
        return YES;
    }
    
    if([resultingString integerValue] <= self.product.number)
    {
        self.buyNumber = [resultingString integerValue];
        return YES;
    }
    return NO;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    _tapRecognazer = [[UITapGestureRecognizer alloc]
                      initWithTarget:self
                      action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:_tapRecognazer];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField.text length] == 0)
        textField.text = @"0";
    
    // remove all zeros from textField line beginning
    if ([textField.text characterAtIndex:0] == '0')
        textField.text = [NSString stringWithFormat:@"%d",[textField.text integerValue]];
    
    //self.buyNumber = [[textField text] integerValue];
    
    [self.view removeGestureRecognizer:_tapRecognazer];
    _tapRecognazer = nil;
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Private

- (void)configureView
{
    if(self.product)
    {
        self.labelProductName.text = self.product.productType.name;
        self.labelProductCategory.text = self.product.productType.category;
        self.labelProductPrice.text = self.product.productType.priceString;
        self.labelProductNumber.text = [NSString stringWithFormat:@"%d", (int)self.product.number];
        self.stepperMinMaxProduct.maximumValue = (double)self.product.number;
        self.textFieldBuyNumber.text = @"0";
        self.buyNumber = 0;
    }
}

-(void)dismissKeyboard
{
    [self.textFieldBuyNumber resignFirstResponder];
}

@end
