//
//  APStackViewController.m
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import "APStackViewController.h"

@interface APStackViewController ()

@end

@implementation APStackViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma Rotation overrides

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (BOOL) shouldAutorotate {
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

- (UIBarButtonItem *) getMenuButtonInState:(enum ButtonState) state {
    
    UIImage* image = [UIImage imageNamed: state == INACTIVE ? @"slideout_button_inactive.png" : @"slideout_button_active.png"];
    //размеры для iOS 6
    CGRect frame = CGRectMake(0, 0, isIOS7 ? 21 : 44, isIOS7 ? 16 : 44);
    UIButton* someButton = [[UIButton alloc] initWithFrame:frame];
    [someButton addTarget:self action:@selector(toggleLeftViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [someButton setImage:image forState:UIControlStateNormal];
    
    if(state == INACTIVE) {
        someButton.alpha = 0.7f;
    }
    
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc] initWithCustomView:someButton];
    return button;
}

@end
