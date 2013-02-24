//
//  LMAppDelegate.m
//  LittleMarket
//
//  Created by BiT Superman on 01.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LMAppDelegate.h"
#import "LMMasterViewController.h"
#import "LMDefaultPersister.h"
#import "LMDataModelManager.h"
#import "LMJsonPersister.h"
#import "LMPersistenceManager.h"
#import "LMApplicationService.h"
#import "LMContainerConfigurator.h"

@implementation LMAppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [LMApplicationService loadApplicationData];
    
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    [LMApplicationService saveApplicationData];
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    [LMApplicationService saveApplicationData];
}


@end
