//
//  Car.m
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfWheels = 4;
    }
    return self;
}

#pragma mark - Factory Method
+ (Car *)carWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource numberOfDoors:(NSInteger)numberOfDoors convertible:(BOOL)isConvertible hatchback:(BOOL)isHatchback sunroof:(BOOL)hasSunroof
{
    Car *newCar = [Car vehicleWithBrandName:brandName modelName:modelName modelYear:modelYear powerSource:powerSource wheels:4];
    
    newCar.numberOfDoors = numberOfDoors;
    newCar.isConvertible = isConvertible;
    newCar.isHatchback = isHatchback;
    newCar.hasSubroof = hasSunroof;
    
    return newCar;
}

#pragma mark - Private method implementations
- (NSString *)start
{
    return [NSString stringWithFormat:@"Start power source %@", self.powerSource];
}

#pragma mark - Superclass Overrides
- (NSString *)goForward
{
    return [NSString stringWithFormat:@"%@ %@ Then depress gas pedal.", [self start], [self changeGears:@"Forward"]];
}

- (NSString *)goBackward
{
    return [NSString stringWithFormat:@"%@ %@ Check your rear view mirror. The depress gas pedal." ,[self start], [self changeGears:@"Reverse"]];
}

- (NSString *)stopMoving
{
    return [NSString stringWithFormat:@"Depress brake pedal. %@", [self changeGears:@"Park"]];
}

- (NSString *)makeNoise
{
    return @"Beep beep!";
}

- (NSString *)vehicleDetailsString
{
    // Get the basic details from superclass
    NSString *basicDetails = [super vehicleDetailsString];
    
    // Initialize mutable string
    NSMutableString *carDetailBuilder = [NSMutableString string];
    [carDetailBuilder appendString:@"\n\nCar-Specific Details:\n\n"];
    
    // String helpers for booleans
    NSString *yes = @"yes\n";
    NSString *no = @"no\n";
    
    // Add info about car-specific features
    [carDetailBuilder appendString:@"Has sunroof: "];
    if (self.hasSubroof) {
        [carDetailBuilder appendString:yes];
    } else {
        [carDetailBuilder appendString:no];
    }
    
    [carDetailBuilder appendString:@"Is Hatchback: "];
    if (self.isHatchback) {
        [carDetailBuilder appendString:yes];
    } else {
        [carDetailBuilder appendString:no];
    }
    
    [carDetailBuilder appendString:@"Is Convertible: "];
    if (self.isConvertible) {
        [carDetailBuilder appendString:yes];
    } else {
        [carDetailBuilder appendString:no];
    }
    
    [carDetailBuilder appendFormat:@"Number of doors: %ld", self.numberOfDoors];
    
    // Create the final string by combining basic and car-specific details
    NSString *carDetails = [basicDetails stringByAppendingString:carDetailBuilder];
    
    return carDetails;
}

@end
