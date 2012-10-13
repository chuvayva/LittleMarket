//
//  MarketMasterViewController.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MarketMasterViewController.h"

#import "MarketDataModelManager.h"
#import "MarketDetailTableViewController.h"
#import "MarketCartViewController.h"
#import "ProductCell.h"
//

@interface MarketMasterViewController ()

- (void)AvailableProductsChanged:(NSNotification *)notification;

@end

@implementation MarketMasterViewController

- (void)AvailableProductsChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    _model = [MarketApplicationService.mainContainer getComponent:@protocol(MarketStoreFrontModel)];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(AvailableProductsChanged:) name:AvailableProductsChanged object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

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
    static NSString *cellIdentifier = @"ProductCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    Product *product = [_model availableProductAtIndex:indexPath.row];
    
    cell.textLabel.text = product.productType.name;
    cell.detailTextLabel.text = product.productType.priceString;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    static NSString *identifier = @"showDetail";
    
    if ([[segue identifier] isEqualToString:identifier])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        Product *product = [_model availableProductAtIndex:indexPath.row];
        
        MarketDetailTableViewController *detailController = (MarketDetailTableViewController*)[segue destinationViewController];

        [detailController setProduct:product];
        detailController.delegate = _model;
    }
}

@end
