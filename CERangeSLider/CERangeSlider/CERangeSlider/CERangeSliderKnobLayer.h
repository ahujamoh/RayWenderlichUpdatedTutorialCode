//
//  CERangeSliderKnobLayer.h
//  CERangeSlider
//
//  Created by yww on 3/10/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class CERangeSlider;

@interface CERangeSliderKnobLayer : CALayer

@property BOOL highlighted;
@property (nonatomic, weak) CERangeSlider *slider;

@end
