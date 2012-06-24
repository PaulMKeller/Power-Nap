//
//  MainViewController.h
//  Power Nap
//
//  Created by Paul Keller on 12/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import "FlipsideViewController.h"
#import <iAd/iAd.h>
#import "PowerNapConfig.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, ADBannerViewDelegate>
@property (strong, nonatomic) IBOutlet ADBannerView *bannerView;
@property (nonatomic, assign) BOOL bannerViewIsVisible;

- (IBAction)setAlarm10Minutes:(id)sender;
- (void)setAlarm:(int)minutes withMessage:(NSString *)message;
- (IBAction)setAlarm15Minutes:(id)sender;
- (IBAction)setAlarm20Minutes:(id)sender;
- (IBAction)setAlarm25Minutes:(id)sender;
- (IBAction)setAlarm30Minutes:(id)sender;
- (IBAction)setAlarm35Minutes:(id)sender;
- (IBAction)setAlarm45Minutes:(id)sender;
- (IBAction)setAlarm60Minutes:(id)sender;
- (IBAction)setAlarm120Minutes:(id)sender;
- (IBAction)cancelAlarms:(id)sender;

@end
