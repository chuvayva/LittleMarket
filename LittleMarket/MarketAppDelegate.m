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

@interface MarketAppDelegate ()

- (void)initPersisterObject;

- (void)initDataModel;


@end


@implementation MarketAppDelegate

@synthesize window = _window;

-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptionson
{
    [self initPersisterObject];
    
    [self initDataModel];
    
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    [MarketPersistenceManager.single.persister saveModel: MarketDataModelManager.single.dataModel];    
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    [MarketPersistenceManager.single.persister saveModel: MarketDataModelManager.single.dataModel];
}

#pragma mark Private Methods

-(void)initPersisterObject
{
    MarketPersistenceManager.single.persister = [MarketJsonPersister new];
}

-(void)initDataModel
{
    MarketDataModelManager.single.dataModel = [MarketPersistenceManager.single.persister loadModel];
}


@end
