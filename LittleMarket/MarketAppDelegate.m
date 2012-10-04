//
//  MarketAppDelegate.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MarketAppDelegate.h"
#import "MarketMasterViewController.h"
#import "MarketDefaultPersister.h"
#import "MarketDataModelManager.h"
#import "MarketJsonPersister.h"
#import "MarketPersistenceManager.h"
#import "MarketApplicationService.h"
#import "MarketConfigurator.h"

@implementation MarketAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MarketApplicationService loadApplicationData];
    
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    [MarketApplicationService saveApplicationData];
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    [MarketApplicationService saveApplicationData];
}


@end
