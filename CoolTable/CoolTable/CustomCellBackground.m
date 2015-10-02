//
//  CustomCellBackground.m
//  CoolTable
//
//  Created by yww on 7/13/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "CustomCellBackground.h"

@implementation CustomCellBackground

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];
    
    CGContextSetFillColorWithColor(context, redColor.CGColor);
    CGContextFillRect(context, self.bounds);
}


@end
