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
@synthesize tag;
@synthesize iconURLString;
@synthesize isActionType;
@synthesize subText;


- (id) initWithAction:(void (^)())action_ titleText:(NSString *)title subText:(NSString *)subText_ iconURLString:(NSString *)iconURLString_ tag:(NSInteger)tag_ {
    self = [super init];
    if (self) {
        self.isActionType = YES;
        self.action = action_;
        self.titleText = title;
        self.subText = subText_;
        self.iconURLString = iconURLString_;
        self.tag = tag_;
    }
    
    return self;
}


- (id)initWithAction:(void (^)())action_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ iconHighlighted:(UIImage *)iconHighlighted_ tag:(NSInteger)tag_ {
    self = [super init];
    if (self) {
        self.isActionType = YES;
        self.action = action_;
        self.titleText = title;
        self.badgeText = text;
        self.icon = icon_;
        self.iconHighlighted = iconHighlighted_;
        self.tag = tag_;
    }
    
    return self;
}

- (id) initWithController:(UIViewController *)controller_ titleText:(NSString *)title badgeText:(NSString *)text icon:(UIImage *)icon_ iconHighlighted:(UIImage *)iconHighlighted_ tag:(NSInteger)tag_ {
    self = [super init];
    if (self) {
        self.isActionType = NO;
        self.controller = controller_;
        self.titleText = title;
        self.badgeText = text;
        self.icon = icon_;
        self.iconHighlighted = iconHighlighted_;
        self.tag = tag_;
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
