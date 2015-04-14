//
//  Truck.h
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

@interface Truck : Vehicle

@property (nonatomic, assign) NSInteger cargoCapacityCubicFeet;

// Factory Method
+ (Truck *)truckWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource wheels:(NSInteger)numberOfWheels cargoCapacityCubicFeet:(NSInteger)cargoCapacityCubicFeet;

@end
