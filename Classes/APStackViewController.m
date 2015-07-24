//
//  APStackViewController.m
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import "APStackViewController.h"
#import "AMNavigationButton.h"
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

- (UIBarButtonItem *)getMenuButtonInState:(enum ButtonState) state {

    UIImage* image = [UIImage imageNamed: state == INACTIVE ? @"slideout_button_inactive" : @"slideout_button_active"];

    
    AMNavigationButton *menuButton = [AMNavigationButton buttonWithType:UIButtonTypeCustom];
    menuButton.isLeftItem = YES;
    
//    menuButton.backgroundColor = [UIColor redColor];
    menuButton.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
    [menuButton.layer setMasksToBounds:YES];
    
    [menuButton addTarget:self action:@selector(toggleLeftViewController) forControlEvents:UIControlEventTouchUpInside];

    [menuButton setImage:image forState:UIControlStateNormal];
    [menuButton.imageView setContentMode:UIViewContentModeTopLeft];
//    CGFloat xEdge = (isIOS7)?((isIpad)?(-25):(-20)):((isIpad)?(-30):(-20));
    
//    menuButton.imageEdgeInsets = UIEdgeInsetsMake(0, xEdge, 0, 0);

    
//    //размеры для iOS 6
//    //CGRect frame = CGRectMake(0, 0, isIOS7 ? 21 : 44, isIOS7 ? 16 : 44);
//    CGRect frame = CGRectMake(0, 0, 44, 44);
//    UIButton* someButton = [[UIButton alloc] initWithFrame:frame];
//    someButton.backgroundColor = [UIColor redColor];
//    
//    [someButton addTarget:self action:@selector(toggleLeftViewController) forControlEvents:UIControlEventTouchUpInside];
//    
//    [someButton setImage:image forState:UIControlStateNormal];
//    someButton.imageView.contentMode = UIViewContentModeLeft;
//    someButton.imageEdgeInsets = UIEdgeInsetsMake(0, (isIOS7)?-15:0, 0, 0);

    if(state == INACTIVE) {
        menuButton.alpha = 0.7f;
    }
    
   // [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    return button;
}

@end
