//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by yww on 4/18/15.
//  Copyright (c) 2015 yww. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScaryBugData.h"

@interface ScaryBugDoc : NSObject

@property (nonatomic, strong) ScaryBugData *data;
@property (nonatomic, strong) UIImage *thumbImage;
@property (nonatomic, strong) UIImage *fullImage;

- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;

@end
