//
//  AppDelegate.h
//  PSGyroScroll Demo
//
//  Created by Phil Scarfi on 8/12/14.
//  Copyright (c) 2014 BuzzFeed Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@class HomeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HomeViewController *hvc;

@end
