//
//  MainViewController.m
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import "MainViewController.h"
#import "InAppPurchaseManager.h"

@implementation MainViewController
@synthesize bannerView;
@synthesize bannerViewIsVisible;


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
    
    bannerView.delegate = self;
    bannerView.frame = CGRectOffset(bannerView.frame, 0.0, bannerView.frame.size.height);
    self.bannerViewIsVisible = NO;
    
}

- (void)viewDidUnload
{
    [self setBannerView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
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
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    if (interfaceOrientation == UIInterfaceOrientationPortrait) {
        return YES;
    } else {
        return NO;
    }

}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

#pragma mark - Ad Banner Methods
- (void)bannerViewDidLoadAd:(ADBannerView *)aBanner {
    if (!self.bannerViewIsVisible) {
        [UIView beginAnimations:@"animatedAdBannerOn" context:NULL];
        bannerView.frame = CGRectOffset(bannerView.frame, 0.0, -bannerView.frame.size.height);
        [UIView commitAnimations];
        self.bannerViewIsVisible = YES;
        NSLog(@"Has Ads, showing");
    }
}

- (void)bannerView:(ADBannerView *)aBanner didFailToReceiveAdWithError:(NSError *)error {
    if (self.bannerViewIsVisible) {
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        bannerView.frame = CGRectOffset(bannerView.frame, 0.0, bannerView.frame.size.height);
        [UIView commitAnimations];
        self.bannerViewIsVisible = NO;
        NSLog(@"Has No Ads, Hiding");
    }
}

- (IBAction)setAlarm10Minutes:(id)sender {
    [self setAlarm:10 withMessage:@"This is your 10 minute Power Nap alarm"];
}

- (void)setAlarm:(int)minutes withMessage:(NSString *)message{
    
    NSDate *now = [NSDate date]; // Grab current time
    NSLog(@"Now Date: %@", now);
    
    
    NSDateComponents *offset = [[NSDateComponents alloc] init];
    [offset setMinute:minutes];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:offset toDate:now options:0];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = newDate;
    NSLog(@"Notification will be shown on: %@",localNotification.fireDate);
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = [NSString stringWithFormat:message];
    localNotification.alertAction = NSLocalizedString(@"OK", nil);
    
    localNotification.soundName = @"Siren_Noise.mp3";
        
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    UIAlertView * confirmationAlert = [[UIAlertView alloc] initWithTitle:@"Alert is Set" message:[NSString stringWithFormat:@"Grab your %d Minute Power Nap!", minutes] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [confirmationAlert show];
    
}

- (IBAction)setAlarm15Minutes:(id)sender {
    [self setAlarm:15 withMessage:@"This is your 15 minute Power Nap alarm"];
}

- (IBAction)setAlarm20Minutes:(id)sender {
    [self setAlarm:20 withMessage:@"This is your 20 minute Power Nap alarm"];
}

- (IBAction)setAlarm25Minutes:(id)sender {
    [self setAlarm:25 withMessage:@"This is your 25 minute Power Nap alarm"];
}

- (IBAction)setAlarm30Minutes:(id)sender {
    [self setAlarm:30 withMessage:@"This is your 30 minute Power Nap alarm"];
}

- (IBAction)setAlarm35Minutes:(id)sender {
    [self setAlarm:35 withMessage:@"This is your 35 minute Power Nap alarm"];
}

- (IBAction)setAlarm45Minutes:(id)sender {
    [self setAlarm:45 withMessage:@"This is your 45 minute Power Nap alarm"];
}

- (IBAction)setAlarm60Minutes:(id)sender {
    [self setAlarm:60 withMessage:@"This is your 1 hour Power Nap alarm"];
}

- (IBAction)setAlarm120Minutes:(id)sender {
    [self setAlarm:120 withMessage:@"This is your 2 hour Power Nap alarm"];
}

- (IBAction)cancelAlarms:(id)sender {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

- (void)codeToKeep {
    //    Keep this because it might be useful for something else...
    
    //    NSDate* sourceDate = [NSDate date];
    //    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    //    NSTimeZone* destinationTimeZone = [NSTimeZone systemTimeZone];
    //    
    //    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:sourceDate];
    //    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:sourceDate];
    //    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //    
    //    NSDate* destinationDate = [[NSDate alloc] initWithTimeInterval:interval sinceDate:sourceDate];
    //    NSLog(@"Destination Date: %@", destinationDate);
    
    //    //Add to the alarms mutable array so we can set badges
    //    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    //    NSMutableArray * currentAlarms = [[NSMutableArray alloc] init];
    //    
    //    if ([defaults objectForKey:K_ALARMS_KEY] != nil) {
    //        [currentAlarms arrayByAddingObjectsFromArray:[defaults objectForKey:K_ALARMS_KEY]];
    //    }
    //    
    //    
    //    [currentAlarms addObject:newDate];
    //    [defaults setObject:currentAlarms forKey:K_ALARMS_KEY];
    //    [defaults synchronize];
    
    
    //    NSUserDefaults * defaults  = [NSUserDefaults standardUserDefaults];
    //    NSMutableArray * currentAlarms = [[NSMutableArray alloc] init];
    //    [defaults setValue:currentAlarms forKey:K_ALARMS_KEY];
    //    [defaults synchronize];

}
@end
