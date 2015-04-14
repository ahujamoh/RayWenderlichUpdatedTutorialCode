//
//  VehicleList.h
//  Vehicles
//
//  Created by yww on 4/14/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VehicleList : NSObject

// The list of the vehicles
@property (nonatomic, strong) NSArray *vehicles;

// Singleton Instance
+ (VehicleList *)sharedInstance;

@end
