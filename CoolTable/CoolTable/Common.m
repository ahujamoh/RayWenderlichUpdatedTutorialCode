//
//  Common.m
//  CoolTable
//
//  Created by yww on 7/13/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "Common.h"

//@implementation Common
//
//@end


void drawLinearGrdient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor) {
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    
    NSArray *colors = @[(__bridge id)startColor, (__bridge id)endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
}