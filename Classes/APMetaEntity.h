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
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, copy) void (^action)();

@property (nonatomic, assign) BOOL isActionType;

- (id) initWithController: (UIViewController *) controller_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tag: (NSInteger) tag_;

- (id) initWithAction: (void (^)()) action_ titleText: (NSString *) title badgeText: (NSString *) text icon: (UIImage *) icon_ tag: (NSInteger) tag_;

@end
