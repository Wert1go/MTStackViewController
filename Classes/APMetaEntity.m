//
//  APMetaEntity.m
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import "APMetaEntity.h"

@implementation APMetaEntity

@synthesize controller;
@synthesize titleText;
@synthesize badgeText;
@synthesize icon;
@synthesize action;

@synthesize isActionType;

- (id) initWithAction:(void (^)())action_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ {
    self = [super init];
    if (self) {
        self.isActionType = YES;
        self.action = action_;
        self.titleText = title;
        self.badgeText = text;
        self.icon = icon_;
    }
    
    return self;
}

- (id) initWithController:(UIViewController *)controller_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ {
    self = [super init];
    if (self) {
        self.isActionType = NO;
        self.controller = controller_;
        self.titleText = title;
        self.badgeText = text;
        self.icon = icon_;
    }
    return self;
}

- (void) setController:(UIViewController *)controller_ {
    if (self.isActionType) {
        [NSException raise:NSInternalInconsistencyException
                    format:@"You must recreate object."];
    }
    
    controller = controller_;
}

@end
