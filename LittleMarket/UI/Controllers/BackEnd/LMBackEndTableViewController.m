//
//  LMBackEndTableViewController.m
//  LittleMarket
//
//  Created by BiT on 12.09.12.
//
//

#import "LMBackEndTableViewController.h"
#import "LMDataModelManager.h"
#import "LMProductCell.h"

@interface LMBackEndTableViewController ()
{
    id<LMBackEndModel> _model;
    
    LMProduct *_editedProduct;
}

@end

@implementation LMBackEndTableViewController

-(void) awakeFromNib
{
    _model = [LMApplicationService.mainContainer getComponent:@protocol(LMBackEndModel)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(availableProductsChanged:) name:AvailableProductsChanged object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void) viewWillDisappear:(BOOL)animated
{
    self.editing = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_model availableProductsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"BackEndProductCell";
    LMProductCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    LMProduct *product = [_model availableProductAtIndex:indexPath.row];
    
    [cell setValuesByProduct:product];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_model removeAvailableProductAtIndex:indexPath.row];
    }
}

- (void)availableProductsChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    static NSString *addIdentifier = @"showProductAdd";
    static NSString *editIdentifier = @"showProductEdit";
    
    if ([segue.identifier isEqualToString:addIdentifier] ||
        [segue.identifier isEqualToString:editIdentifier])
    {
        LMProductEditViewController *editController = (LMProductEditViewController *)[[(UINavigationController*)[segue destinationViewController] viewControllers] objectAtIndex:0];
        
        editController.delegate = self;
        
        if([segue.identifier isEqualToString:editIdentifier])
        {
            NSUInteger editedIndex = [[self.tableView indexPathForSelectedRow] row];
            
            LMProduct *product = [_model availableProductAtIndex:editedIndex];
        
            editController.editedProduct = product;
        }
    }
}

#pragma mark - MarketProductEditViewControllerDelegate

-(void) addProduct: (LMProduct *) newProduct
{
    [NSThread detachNewThreadSelector:@selector(addAvailableProduct:) toTarget:_model withObject:newProduct];
    
//    [_model addAvailableProduct:newProduct];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void) replaceOldProduct: (LMProduct *) oldProduct withNewProduct: (LMProduct *) newProduct
{
    [NSThread detachNewThreadSelector:@selector(replaceAvailableProduct:) toTarget:_model withObject:@[oldProduct,newProduct]];
//    dispatch_queue_t replaceQueue = dispatch_queue_create("replaceQueue", NULL);
//    
//    dispatch_async(replaceQueue, ^{
//        [_model replaceAvailableProduct:@[oldProduct,newProduct]];
//    });

    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void) addProductDidClose
{
    [self dismissViewControllerAnimated:YES completion:NULL];
 //   [self.tableView reloadData];
}

@end
