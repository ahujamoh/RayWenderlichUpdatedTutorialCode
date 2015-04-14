//
//  Truck.m
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Truck.h"

@implementation Truck

#pragma mark - Factory Method
+ (Truck *)truckWithBrandName:(NSString *)brandName modelName:(NSString *)modelName modelYear:(NSInteger)modelYear powerSource:(NSString *)powerSource wheels:(NSInteger)numberOfWheels cargoCapacityCubicFeet:(NSInteger)cargoCapacityCubicFeet
{
    Truck *newTruck = [Truck vehicleWithBrandName:brandName modelName:modelName modelYear:modelYear powerSource:powerSource wheels:numberOfWheels];
    
    newTruck.cargoCapacityCubicFeet = cargoCapacityCubicFeet;
    
    return newTruck;
}

#pragma mark - Superclass overrides
- (NSString *)goForward
{
    return [NSString stringWithFormat:@"%@ Depress gas pedal.", [self changeGears:@"Drive"]];
}

- (NSString *)stopMoving
{
    return [NSString stringWithFormat:@"Depress brake pedal. %@", [self changeGears:@"Park"]];
}

- (NSString *)goBackward
{
    NSMutableString *backwardString = [NSMutableString string];
    if (self.cargoCapacityCubicFeet > 100) {
        [backwardString appendFormat:@"Wait for \"%@\", then %@", [self soundBackAlarm], [self changeGears:@"Reverse"]];
    } else {
        [backwardString appendFormat:@"%@ Depress gas pedal.", [self changeGears:@"Reverse"]];
    }
    
    return backwardString;
}

- (NSString *)makeNoise
{
    if (self.numberOfWheels <=4) {
        return @"Beep beep!";
    } else if (self.numberOfWheels > 4 && self.numberOfWheels <=8) {
        return @"Honk!";
    } else {
        return @"HOOOOOOOONK!";
    }
}

-(NSString *)vehicleDetailsString
{
    //Get basic details from superclass
    NSString *basicDetails = [super vehicleDetailsString];
    
    //Initialize mutable string
    NSMutableString *truckDetailsBuilder = [NSMutableString string];
    [truckDetailsBuilder appendString:@"\n\nTruck-Specific Details:\n\n"];
    
    //Add info about truck-specific features.
    [truckDetailsBuilder appendFormat:@"Cargo Capacity: %ld cubic feet", self.cargoCapacityCubicFeet];
    
    //Create the final string by combining basic and truck-specific details.
    NSString *truckDetails = [basicDetails stringByAppendingString:truckDetailsBuilder];
    
    return truckDetails;
}

#pragma mark - Private methods
- (NSString *)soundBackAlarm
{
    return @"Beep! Beep! Beep! Beep!";
}



@end
