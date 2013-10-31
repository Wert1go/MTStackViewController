//
//  APMenuViewController.h
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifo Inc. All rights reserved.
//

@class APMenuTableCell, APMetaEntity;

@interface APMenuViewController : UITableViewController

@property (nonatomic, readonly) NSMutableArray *sections;
@property (nonatomic, readonly) NSMutableDictionary *menuElements;

- (void) configureMenu;

- (void) addMenuSectionWithTitle: (NSString *) title;

- (void) addMenuElementWithController: (UIViewController *) controller_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tagged: (NSInteger) tag;
- (void) addMenuElementWithController: (UIViewController *) controller_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ inSection: (NSInteger) sectionId tagged: (NSInteger) tag;

- (void) addMenuElementWithAction: (void (^)()) action_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tagged: (NSInteger) tag;
- (void) addMenuElementWithAction: (void (^)()) action_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ inSection: (NSInteger) sectionId tagged: (NSInteger) tag;
- (void)configureCell:(APMenuTableCell *)cell atIndexPath:(NSIndexPath *)indexPath;
- (APMetaEntity *) entityForIndexPath: (NSIndexPath *) indexPath;
@end
