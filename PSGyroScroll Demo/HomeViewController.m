//
//  HomeViewController.m
//  PSGyroScroll Demo
//
//  Created by Phil Scarfi on 8/12/14.
//  Copyright (c) 2014 BuzzFeed Inc. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController () {
    NSMutableArray *_objects;

}

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _objects = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19"]];

    self.scroll = [[PSGyroScroll alloc] initWithView:self.tableView
                                          resistance:50.00
                                           andOffset:CGPointMake(0, 0)];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.scroll startGyro];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.scroll stopGyro];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = _objects[indexPath.row];
    //etc.
    return cell;
}





@end
