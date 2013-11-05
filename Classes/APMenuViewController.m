//
//  APMenuViewController.m
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import "APMenuViewController.h"

#import "MTStackViewController.h"
#import "APMetaEntity.h"

#import "APMenuViewControllerConfig.h"
#import "APStackViewControllerConfig.h"
#import "APMenuTableCell.h"
#import "APMenuTableHeader.h"

static NSString *const APTableViewCellIdentifier = @"APTableViewCellIdentifier";

@interface APMenuViewController ()

@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, strong) NSMutableDictionary *menuElements;

@property (nonatomic, assign) BOOL didSetInitialViewController;

@end

@implementation APMenuViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.sections = [NSMutableArray array];
        self.menuElements = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.backgroundColor = kBackground;
	self.tableView.scrollsToTop = NO;
    
    [self configureMenu];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.frame = CGRectMake(0, 0, kSlideOutMenuWidth, self.tableView.frame.size.height);
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.tableView reloadData];
    
    if (!self.didSetInitialViewController)
    {
        [self setInitialViewController];
        self.didSetInitialViewController = YES;
    }
}

- (void) configureMenu {
    //do nothing
}

- (void)setInitialViewController
{
    [self tableView:[self tableView] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) addMenuSectionWithTitle: (NSString *) title{
    [self.sections addObject:title];
    [self.menuElements setObject:[NSMutableArray array] forKey:[NSNumber numberWithInt:[self lastSectionID]]];
}

- (NSInteger) lastSectionID {
    if (self.sections.count > 0) {
        return self.sections.count - 1;
    }
    
    return 0;
}

- (void) addMenuElementWithAction:(void (^)())action_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ tagged:(NSInteger)tag{
    [self addMenuElementWithAction:action_ titleText:title badgeText:text icon:icon_ inSection:[self lastSectionID] tagged:tag];
}

- (void) addMenuElementWithAction:(void (^)())action_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ inSection:(NSInteger)sectionId tagged:(NSInteger)tag {
    APMetaEntity *element = [[APMetaEntity alloc] initWithAction:action_ titleText:title badgeText:text icon:icon_ tag:tag];
    NSMutableArray *sectionElements = self.menuElements[[NSNumber numberWithInt:sectionId]];
    [sectionElements addObject:element];
    element.indexPath = [NSIndexPath indexPathForRow:sectionElements.count - 1 inSection:sectionId];
}

- (void) addMenuElementWithController:(UIViewController *)controller_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ tagged:(NSInteger)tag {
    [self addMenuElementWithController:controller_ titleText:title badgeText:text icon:icon_ inSection:[self lastSectionID]tagged:tag];
}

- (void) addMenuElementWithController:(UIViewController *)controller_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ inSection:(NSInteger)sectionId tagged:(NSInteger)tag {
    APMetaEntity *element = [[APMetaEntity alloc] initWithController:controller_ titleText:title badgeText:text icon:icon_ tag:tag];
    NSMutableArray *sectionElements = self.menuElements[[NSNumber numberWithInt:sectionId]];
    [sectionElements addObject:element];
    
    element.indexPath = [NSIndexPath indexPathForRow:sectionElements.count - 1 inSection:sectionId];
}

#pragma mark - UITableViewDatasource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APMenuTableCell *cell = [tableView dequeueReusableCellWithIdentifier:APTableViewCellIdentifier];
    if (!cell) {
        cell = [[APMenuTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:APTableViewCellIdentifier];
        
        if (indexPath.section != 0 && indexPath.row == 0) {
            cell.showTopBorder = YES;
        } else {
            cell.showTopBorder = NO;
            cell.showFullSize = NO;
        }
        
        if (indexPath.section == 1 && indexPath.row == [self tableView:tableView numberOfRowsInSection:indexPath.section] - 1) {
            cell.showFullSize = YES;
        }
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *title = self.sections[section];
    if (title) {
        APMenuTableHeader *header = [[APMenuTableHeader alloc] init];
        header.titleLabel.text = [title uppercaseString];
        [header.titleLabel setFont:[UIFont fontWithName:kCommonFontNameBold size:14.0f]];
        return header;
    }
    
    return nil;
}

- (float) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 28.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSMutableArray *elements = self.menuElements[[NSNumber numberWithInt:section]];
    return elements.count;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    APMetaEntity *entity = [self entityForIndexPath:indexPath];
    
    if (entity.isActionType) {
        entity.action();
    } else {
        [[self stackViewController] setActiveViewControllerAndHideMenu:entity.controller];
    }
    
    //Or you can do other staff and simple hide menu like that: [[self stackViewController] hideLeftViewController];
}

- (void)configureCell:(APMenuTableCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    APMetaEntity *entity = [self entityForIndexPath:indexPath];
    
    if (entity.icon) {
        [cell.imageView setImage:entity.icon];
    }
    
    [cell.textLabel setFont:[UIFont fontWithName:kCommonFontName size:kCommonFontSize]];
    [cell.textLabel setText:entity.titleText];
    [cell setBadgeText:entity.badgeText];
}

- (APMetaEntity *) entityForIndexPath: (NSIndexPath *) indexPath {
    NSMutableArray *elements = self.menuElements[[NSNumber numberWithInt:indexPath.section]];

    
    return elements[indexPath.row];
}

@end