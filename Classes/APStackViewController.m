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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Rotation overrides

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (BOOL) shouldAutorotate {
    return YES;
}

- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIBarButtonItem *) getMenuButtonInState:(enum ButtonState) state {
    
    UIImage* image = [UIImage imageNamed: state == INACTIVE ? @"slideout_button_inactive.png" : @"slideout_button_active.png"];
    CGRect frame = CGRectMake(0, 0, 44, 44);
    UIButton* someButton = [[UIButton alloc] initWithFrame:frame];
    [someButton addTarget:self action:@selector(toggleLeftViewController) forControlEvents:UIControlEventTouchUpInside];
    [someButton setBackgroundImage:image forState:UIControlStateNormal];
    [someButton setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc] initWithCustomView:someButton];
    return button;
}

@end
