//
//  ScaryBugDoc.m
//  ScaryBugs
//
//  Created by yww on 4/18/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import "ScaryBugDoc.h"

@implementation ScaryBugDoc

- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage
{
    if (self = [super init]) {
        self.data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        self.thumbImage = thumbImage;
        self.fullImage = fullImage;
    }
    
    return self;
}

@end
