//
//  PSGyroScroll.h
//  TableGyro
//
//  Created by Phil Scarfi on 8/12/14.
//  Copyright (c) 2014 BuzzFeed Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSGyroScroll : NSObject

- (id)initWithView:(UIScrollView *)view resistance:(NSUInteger)resistance andOffset:(CGPoint)offset;

- (void)startGyro;
- (void)stopGyro;

@property (strong, nonatomic) UIScrollView *view;

@end
