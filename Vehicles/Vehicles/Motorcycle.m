//
//  Motorcycle.m
//  Vehicles
//
//  Created by yww on 4/13/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "Motorcycle.h"

@implementation Motorcycle

#pragma mark - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfWheels = 2;
        self.powerSource = @"gas engine";
    }
    return self;
}

#pragma mark - Superclass Overrides
- (NSString *)goForward
{
    return [NSString stringWithFormat:@"%@ open throttle.", [self changeGears:@"Forward"]];
}

- (NSString *)goBackward
{
    return [NSString stringWithFormat:@"%@ walk %@ backwards using feet.", [self changeGears:@"Neutral"], self.modelName];
}

- (NSString *)stopMoving
{
    return @"Squeeze brakes";
}

- (NSString *)makeNoise
{
    return self.engineNoise;
}

- (NSString *)vehicleDetailsString
{
    NSString *basicDetails = [super vehicleDetailsString];
    
    NSMutableString *motorcycleDetailsBuilder = [NSMutableString string];
    [motorcycleDetailsBuilder appendString:@"\n\nMotorcycle-Specific Details:\n\n"];
    
    [motorcycleDetailsBuilder appendFormat:@"Engine Noise: %@", self.engineNoise];
    
    NSString *motorcycleDetails = [basicDetails stringByAppendingString:motorcycleDetailsBuilder];
    
    return motorcycleDetails;
}

@end
