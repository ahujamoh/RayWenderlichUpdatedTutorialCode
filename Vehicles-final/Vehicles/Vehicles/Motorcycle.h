//
//  Motorcycle.h
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Vehicle.h"

@interface Motorcycle : Vehicle

@property (nonatomic, strong) NSString *engineNoise;

// Factory Method
+ (Motorcycle *)motorcycleWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear engineNoise:(NSString *)engineNoise;

@end
