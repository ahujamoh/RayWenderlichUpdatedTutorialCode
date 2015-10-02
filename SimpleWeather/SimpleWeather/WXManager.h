//
//  WXManager.h
//  SimpleWeather
//
//  Created by yww on 6/14/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Foundation;
@import CoreLocation;
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "WXCondition.h"

@interface WXManager : NSObject <CLLocationManagerDelegate>

+ (instancetype)sharedManager;

@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong, readonly) WXCondition *currentCondition;
@property (nonatomic, strong, readonly) NSArray *hourlyForecast;
@property (nonatomic, strong, readonly) NSArray *dailyForecast;

- (void)findCurrentLocation;

@end
