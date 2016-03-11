//
//  CERangeSlider.h
//  CERangeSlider
//
//  Created by yww on 3/8/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CERangeSlider : UIControl

@property (nonatomic) float maximumValue;
@property (nonatomic) float minimumValue;
@property (nonatomic) float upperValue;
@property (nonatomic) float lowerValue;

@property (nonatomic) UIColor *trackColor;
@property (nonatomic) UIColor *trackHighlightColor;
@property (nonatomic) UIColor *knobColor;
@property (nonatomic) float curvaceousness;

- (float)positionForValue:(float)value;

@end
