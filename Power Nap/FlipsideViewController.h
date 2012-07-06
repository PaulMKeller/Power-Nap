//
//  FlipsideViewController.h
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PowerNapConfig.h"
#import "InAppPurchaseManager.h"
#import "AppDelegate.h"

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <FlipsideViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIDatePicker *dateTimePicker;
@property (strong, nonatomic) IBOutlet UIImageView *lockImageView;
@property (strong, nonatomic) IBOutlet UIButton *setPowerNapButton;
@property (strong, nonatomic) IBOutlet UILabel *adviceLabel;
@property (strong, nonatomic) IBOutlet UIButton *upgradeButton;
@property (strong, nonatomic) IBOutlet UIButton *restoreButton;

- (IBAction)done:(id)sender;
- (IBAction)setOwnAlarm:(id)sender;
- (IBAction)buyUpgrade:(id)sender;
- (IBAction)restoreUpgrade:(id)sender;
- (void)checkForUpgrade;


@end
