//
//  HomeViewController.h
//  PSGyroScroll Demo
//
//  Created by Phil Scarfi on 8/12/14.
//  Copyright (c) 2014 BuzzFeed Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSGyroScroll.h"

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet PSGyroScroll *scroll;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
