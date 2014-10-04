//
//  PSGyroScroll.m
//  TableGyro
//
//  Created by Phil Scarfi on 8/12/14.
//  Copyright (c) 2014 BuzzFeed Inc. All rights reserved.
//

#import "PSGyroScroll.h"
#import <CoreMotion/CoreMotion.h>

#define degrees(x) (180 * x / M_PI)

@interface PSGyroScroll() {
    CMMotionManager *_motionManager;
}

@property long resistance;
@property CGPoint offset;

@end

@implementation PSGyroScroll

- (id)initWithView:(UIScrollView *)view resistance:(long)resistance andOffset:(CGPoint)offset {
    self = [super init];
    if (self) {
        self.resistance = resistance;
        self.offset = offset;
        self.view = view;
    }
    return self;
}

#pragma mark - GYRO

- (void)startGyro {
    _motionManager = [[CMMotionManager alloc] init];
    _motionManager.gyroUpdateInterval = 0.001;
    _motionManager.deviceMotionUpdateInterval = 0.01;
    _motionManager.accelerometerUpdateInterval = .01;

    if ([_motionManager isGyroAvailable]) {
        [_motionManager startDeviceMotionUpdatesToQueue: [NSOperationQueue mainQueue]
            withHandler:^(CMDeviceMotion *motion, NSError *error) {
               CMAttitude *attitude = motion.attitude;
               //long speed = degrees(attitude.pitch)/self.resistance;

                
            long xOff = self.view.contentOffset.x;
            long yOff = 0.000;
               if (degrees(attitude.pitch) > 40.00) {//Scroll Down
                   yOff = self.view.contentOffset.y + degrees(attitude.pitch)/self.resistance;
               }
               else if (degrees(attitude.pitch) < 0.00) {//Scroll back up
                   yOff = self.view.contentOffset.y + degrees(attitude.pitch)/self.resistance;
               }
               if ([self shouldScrollToOffset:CGPointMake(xOff, yOff)] && yOff != 0) {//Do the actual Scrolling
                   [self.view setContentOffset:CGPointMake(xOff, yOff)];
                   NSLog(@"%ld",yOff);
               }
            }];
    }
}

-(void)stopGyro {
    _motionManager = nil;
}

- (BOOL)shouldScrollToOffset:(CGPoint)offset {
    //NSLog(@"Off:%f",offset.y);
    long max = self.view.contentSize.height - self.view.bounds.size.height;
    long min = -1 * offset.y;
    return min <= offset.y && offset.y < max ;
}

@end

/*TODO
 What if horizontal? use roll instead?
*/