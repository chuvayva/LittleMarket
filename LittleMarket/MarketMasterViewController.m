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
    _model = [MarketDataModelManager storeFrontDataModel];
    
    
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

- (void)insertNewObject:(id)sender
{
//    if (!_objects) {
//        _objects = [[NSMutableArray alloc] init];
//    }
//    [_objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
    
    //[cell setValuesByProduct:product];
    cell.textLabel.text = product.productType.name;
    cell.detailTextLabel.text = product.productType.priceString;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [_objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//    }
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
