//
//  MTMenuViewController.m
//  MTStackViewControllerExample
//
//  Created by Andrew Carter on 1/31/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import "MTMenuViewController.h"
#import "MTStackViewController.h"

#import "APMenuViewControllerConfig.h"
#import "APMenuTableCell.h"
#import "APMenuTableHeader.h"

static NSString *const MTTableViewCellIdentifier = @"MTTableViewCell";

@interface MTMenuViewController ()
{
    NSMutableArray *_datasource;
    BOOL _didSetInitialViewController;
}

@property (nonatomic, strong) UIBarButtonItem *toggleButton;

@end

@implementation MTMenuViewController

@synthesize toggleButton;

#pragma mark - UIViewController Overrides

- (id)init
{
    self = [super init];
    if (self)
    {
        _datasource = [NSMutableArray new];
        [self populateDatasource];
        
        [[self navigationItem] setTitle:@"Menu"];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = kBackground;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    if (!_didSetInitialViewController)
    {
        [self setInitialViewController];
        _didSetInitialViewController = YES;
    }
}

#pragma mark - Instance Methods

- (void)setInitialViewController
{
    [self tableView:[self tableView] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)populateDatasource
{
    [_datasource setArray:@[
        [UIColor redColor],
        [UIColor blueColor],
        [UIColor greenColor],
        [UIColor yellowColor],
        [UIColor purpleColor]
     ]];
}

- (void)configureCell:(APMenuTableCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    [[cell textLabel] setText:[NSString stringWithFormat:@"View Controller %d", [indexPath row]]];
}

- (UIViewController *)contentViewcontrollerForIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController = [[UIViewController alloc] init];
    [[viewController view] setBackgroundColor:_datasource[[indexPath row]]];
    [[viewController navigationItem] setTitle:[NSString stringWithFormat:@"View Controller %d", [indexPath row]]];
    
    
    
    return viewController;
}


#pragma mark - UITableViewDatasource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APMenuTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MTTableViewCellIdentifier];
    if (!cell) {
        cell = [[APMenuTableCell alloc] init];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        APMenuTableHeader *header = [[APMenuTableHeader alloc] init];
        header.titleLabel.text = @"Menu";
        return header;
    }
    
    return nil;
}

- (float) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 28.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_datasource count];
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[self stackViewController] setActiveViewControllerAndHideMenu:[self contentViewcontrollerForIndexPath:indexPath]];
    //Or you can do other staff and simple hide menu like that: [[self stackViewController] hideLeftViewController];
}

@end
