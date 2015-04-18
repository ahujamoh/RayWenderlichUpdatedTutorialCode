//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by yww on 4/18/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (id)initWithTitle:(NSString *)title rating:(float)rating
{
    if (self = [super init]) {
        self.title = title;
        self.rating = rating;
    }
    
    return self;
}

@end
