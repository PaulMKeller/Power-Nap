//
//  SKProduct.h
//  Power Nap
//
//  Created by Paul Keller on 21/06/2012.
//  Copyright (c) 2012 Nutty Cake Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@interface SKProduct (LocalizedPrice)

@property (nonatomic, readonly) NSString *localizedPrice;

@end
