//
//  Car.h
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

@interface Car : Vehicle

@property (nonatomic, assign) BOOL isConvertible;
@property (nonatomic, assign) BOOL isHatchback;
@property (nonatomic, assign) BOOL hasSubroof;
@property (nonatomic, assign) NSInteger numberOfDoors;

@end
