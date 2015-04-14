//
//  VehicleList.m
//  Vehicles
//
//  Created by yww on 4/14/15.
//  Copyright (c) 2015 Designated Nerd Software. All rights reserved.
//

#import "VehicleList.h"
#import "Car.h"
#import "Motorcycle.h"
#import "Truck.h"

@implementation VehicleList

+ (VehicleList *)sharedInstance
{
    static VehicleList *_vehicleList = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _vehicleList = [[VehicleList alloc] init];
        _vehicleList.vehicles = [VehicleList initialVehicleList];
    });
    
    return _vehicleList;
}

+ (NSArray *)initialVehicleList
{
    NSMutableArray *vehicles = [NSMutableArray array];
    
    Car *mustang = [Car carWithBrandName:@"Ford" modelName:@"Mustang" modelYear:1968 powerSource:@"gas engine" numberOfDoors:2 convertible:YES hatchback:NO sunroof:NO];
    
    [vehicles addObject:mustang];
    
    Car *outback = [Car carWithBrandName:@"Subaru" modelName:@"Outback" modelYear:1999 powerSource:@"gas engine" numberOfDoors:5 convertible:NO hatchback:YES sunroof:NO];
    
    [vehicles addObject:outback];
    
    Car *prius = [Car carWithBrandName:@"Toyota" modelName:@"Prius" modelYear:2002 powerSource:@"hybrid engine" numberOfDoors:4 convertible:NO hatchback:YES sunroof:YES];
    
    [vehicles addObject:prius];
    
    //Add a motorcycle
    Motorcycle *harley = [Motorcycle motorcycleWithBrandName:@"Harley-Davidson"
                                                   modelName:@"Softail" modelYear:1979 engineNoise:@"Vrrrrrrrroooooooooom!"];
    
    //Add it to the array.
    [vehicles addObject:harley];
    
    //Add another motorcycle
    Motorcycle *kawasaki = [Motorcycle motorcycleWithBrandName:@"Kawasaki"
                                                     modelName:@"Ninja" modelYear:2005 engineNoise:@"Neeeeeeeeeeeeeeeeow!"];
    
    //Add it to the array
    [vehicles addObject:kawasaki];
    
    //Create a truck
    Truck *silverado = [Truck truckWithBrandName:@"Chevrolet" modelName:@"Silverado"
                                       modelYear:2011 powerSource:@"gas engine" wheels:4 cargoCapacityCubicFeet:53];
    
    [vehicles addObject:silverado];
    
    //Create another truck
    Truck *eighteenWheeler = [Truck truckWithBrandName:@"Peterbilt" modelName:@"579"
                                             modelYear:2013 powerSource:@"diesel engine" wheels:18 cargoCapacityCubicFeet:408];
    
    [vehicles addObject:eighteenWheeler];
    
    // Sort the array by the model year
    NSSortDescriptor *modelYear = [NSSortDescriptor sortDescriptorWithKey:@"modelYear" ascending:YES];
    [vehicles sortUsingDescriptors:@[modelYear]];

    return vehicles;
}

@end
