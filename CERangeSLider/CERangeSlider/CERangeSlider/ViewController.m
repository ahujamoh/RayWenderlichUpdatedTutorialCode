//
//  ViewController.m
//  CERangeSlider
//
//  Created by yww on 3/8/16.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "ViewController.h"
#import "CERangeSlider.h"

static NSUInteger const kMargin = 20;

@interface ViewController ()

@property (nonatomic, strong) CERangeSlider *rangeSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _rangeSlider = [[CERangeSlider alloc] initWithFrame:CGRectMake(kMargin, kMargin, self.view.frame.size.width - kMargin * 2, 30)];
//    self.rangeSlider.backgroundColor = [UIColor whiteColor];
    [self.rangeSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.rangeSlider];
    
    [self performSelector:@selector(updateState) withObject:nil afterDelay:1.0f];
}

- (void)sliderValueChanged: (id)control {
    NSLog(@"Slider value changed: (%.2f %2.f)", _rangeSlider.lowerValue, _rangeSlider.upperValue);
}

- (void)updateState {
    _rangeSlider.trackHighlightColor = [UIColor redColor];
    _rangeSlider.curvaceousness = 0.0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
