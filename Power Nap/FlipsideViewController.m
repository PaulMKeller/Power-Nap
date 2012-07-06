//
//  FlipsideViewController.m
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import "FlipsideViewController.h"

@implementation FlipsideViewController

@synthesize delegate = _delegate;
@synthesize dateTimePicker = _dateTimePicker;
@synthesize lockImageView = _lockImageView;
@synthesize setPowerNapButton = _setPowerNapButton;
@synthesize adviceLabel = _adviceLabel;
@synthesize upgradeButton = _upgradeButton;
@synthesize restoreButton = _restoreButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aNotificationHandler:) name:kInAppPurchaseManagerTransactionSucceededNotification object:nil];
}

- (void)viewDidUnload
{
    [self setDateTimePicker:nil];
    [self setLockImageView:nil];
    [self setSetPowerNapButton:nil];
    [self setAdviceLabel:nil];
    [self setUpgradeButton:nil];
    [self setRestoreButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    [self checkForUpgrade];
    
    [super viewWillAppear:animated];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)setOwnAlarm:(id)sender {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = _dateTimePicker.date;
    NSLog(@"Notification will be shown on: %@",localNotification.fireDate);
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = [NSString stringWithFormat:@"Your Power Nap Alarm has been set."];
    localNotification.alertAction = NSLocalizedString(@"OK", nil);
    
    localNotification.soundName = @"Siren_Noise.mp3";
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    UIAlertView * confirmationAlert = [[UIAlertView alloc] initWithTitle:@"Alert is Set" message:@"Grab your Power Nap!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [confirmationAlert show];
}

- (IBAction)buyUpgrade:(id)sender {
    AppDelegate *sharedDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([sharedDelegate.sharedInAppPurchaseManager canMakePurchases]) {
        [sharedDelegate.sharedInAppPurchaseManager purchaseProUpgrade];
        
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Purchase" message:@"You can not make purchases at this time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)restoreUpgrade:(id)sender {
    AppDelegate *sharedDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([sharedDelegate.sharedInAppPurchaseManager canMakePurchases]) {
        [sharedDelegate.sharedInAppPurchaseManager restorePurchases];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"No Purchase" message:@"You can not make purchases at this time." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

- (void)checkForUpgrade
{
    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    
    if ([defaults boolForKey:@"isProUpgradePurchased"] == YES) {
        //Enable the functionality
        _lockImageView.hidden = YES;
        _upgradeButton.hidden = YES;
        _restoreButton.hidden = YES;
        
        _dateTimePicker.hidden = NO;
        _adviceLabel.hidden = NO;
        _setPowerNapButton.hidden = NO;
    }
}

- (void)aNotificationHandler:(NSNotification*)notification  
{  
    
    _lockImageView.hidden = YES;
    _upgradeButton.hidden = YES;
    _restoreButton.hidden = YES;
    
    _dateTimePicker.hidden = NO;
    _adviceLabel.hidden = NO;
    _setPowerNapButton.hidden = NO;
        
}  

@end
