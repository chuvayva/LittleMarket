//
//  MarketCartTableViewController.m
//  LittleMarket
//
//  Created by BiT on 29.08.12.
//
//

#import "LMCartViewController.h"
#import "LMDataModelManager.h"
#import "LMCartProductCell.h"

@interface LMCartViewController ()

- (void)cartProductsChanged:(NSNotification *)notification;

-(void) leaveSelfTab;

@end

@implementation LMCartViewController

-(void)awakeFromNib
{
    _model = [LMApplicationService.mainContainer getComponent:@protocol(LMCartTableModel)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cartProductsChanged:) name:CartProductsChanged object:nil];
}

-(void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    [self cartProductsChanged:nil];
}


- (void)viewDidUnload
{
    self.navigationItem.leftBarButtonItem = nil;
    [super viewDidUnload];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_model cartProductsCount];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CartProductCell";
    
    LMCartProductCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    LMProduct *product = [_model cartProductAtIndex:indexPath.row];
    
    [cell setValuesByProduct:product];
 
    return cell;
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:animated];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle: @"Do you want to buy this product?"   delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Buy" otherButtonTitles: nil];

    [sheet  showInView:[UIApplication sharedApplication].keyWindow];
}


- (IBAction)iWantBuyTheeseProducts:(id)sender
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Do you want to make a purchase?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Buy All" otherButtonTitles: nil];
    
    [sheet  showInView:[UIApplication sharedApplication].keyWindow];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_model returnCartProductAtIndex:indexPath.row];
   
        if (![_model cartProductsCount])
        {
            [self setEditing:NO];           
            
            [self leaveSelfTab];
        }
    }
}

#pragma mark - UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ([buttonTitle isEqualToString:@"Buy All"])
    {
        [_model buyAllProducts];
    }
    else if ([buttonTitle isEqualToString:@"Buy"])
    {
        [_model buyProductAtIndex:self.tableView.indexPathForSelectedRow.row];
    }
    else if ([buttonTitle isEqualToString:@"Cancel"])
    {
        [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
    }
   
}

#pragma mark - Private

- (void)cartProductsChanged:(NSNotification *)notification
{
    if ([_model cartProductsCount])
    {
        self.navigationController.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", [_model cartProductsCount]];
        self.navigationController.tabBarItem.enabled = YES;
    }
    else
    {
        [self leaveSelfTab];
    }
    
    [self.tableView reloadData];
}

-(void) leaveSelfTab
{
    self.navigationController.tabBarItem.badgeValue = nil;
    self.navigationController.tabBarItem.enabled = NO;
    
    self.tabBarController.selectedIndex = ([self.tabBarController.viewControllers indexOfObject:self] == 0) ? 1 : 0;   
}

@end
