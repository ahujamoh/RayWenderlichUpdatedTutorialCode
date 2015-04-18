//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by yww on 4/18/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating;

@end
