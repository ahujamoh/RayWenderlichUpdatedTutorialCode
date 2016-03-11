//
//  CERangeSlider.h
//  CERangeSlider
//
//  Created by yww on 3/8/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CERangeSlider : UIControl

/**
 *  default 10.0.
 */
@property (nonatomic) float maximumValue;
/**
 *  default 0.0
 */
@property (nonatomic) float minimumValue;
/**
 *  default 8.0
 */
@property (nonatomic) float upperValue;
/**
 *  default 2.0
 */
@property (nonatomic) float lowerValue;

@property (nonatomic) UIColor *trackColor;
@property (nonatomic) UIColor *trackHighlightColor;
@property (nonatomic) UIColor *knobColor;
@property (nonatomic) float curvaceousness;

- (float)positionForValue:(float)value;

@end
