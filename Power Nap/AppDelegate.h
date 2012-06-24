//
//  AppDelegate.h
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InAppPurchaseManager.h"

@class InAppPurchaseManager;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray * alarms;
@property (strong, nonatomic) InAppPurchaseManager * sharedInAppPurchaseManager;
@property (assign, nonatomic) BOOL hasUpgraded;

- (void)setIconBadge;
- (void)showActivityIndicator;
- (void)hideActivityIndicator;


@end
