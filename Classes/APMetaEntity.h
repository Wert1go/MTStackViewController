//
//  APMetaEntity.h
//  MTStackViewControllerExample
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APMetaEntity : NSObject

@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *badgeText;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) NSString *iconURLName;
@property (nonatomic, assign) NSInteger tag;

@property (nonatomic, strong) NSString *subText;

@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) void (^action)();

@property (nonatomic, assign) BOOL isActionType;

- (id)initWithAction:(void (^)())action_ titleText:(NSString *)title subText:(NSString *)subText_ iconURLName:(NSString *)iconURLName_ tag:(NSInteger)tag_;
    
- (id)initWithController: (UIViewController *) controller_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tag: (NSInteger) tag_;

- (id)initWithAction: (void (^)()) action_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tag: (NSInteger) tag_;

@end
