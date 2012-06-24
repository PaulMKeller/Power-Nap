//
//  AppDelegate.m
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import "AppDelegate.h"
#import "PowerNapConfig.h"
#include <sqlite3.h>

@implementation AppDelegate

@synthesize window = _window;
@synthesize alarms;
@synthesize sharedInAppPurchaseManager;
@synthesize hasUpgraded;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self showActivityIndicator];
    
    sharedInAppPurchaseManager = [[InAppPurchaseManager alloc] init];
    [sharedInAppPurchaseManager loadStore];
    
    [self hideActivityIndicator];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    [self setIconBadge];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    //[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    //[self setIconBadge];
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    
    [self setIconBadge];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //[UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    [self setIconBadge];
    
}

- (void)setIconBadge {
    NSArray * notifs = [[UIApplication sharedApplication] scheduledLocalNotifications];
    [UIApplication sharedApplication].applicationIconBadgeNumber = [notifs count];
}

- (void)showActivityIndicator
{
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}

- (void)hideActivityIndicator
{
    UIApplication* app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = NO;
}



@end
