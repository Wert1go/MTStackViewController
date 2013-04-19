//
//  MTAppDelegate.m
//  MTStackViewControllerExample
//
//  Created by Andrew Carter on 1/31/13.
//  Copyright (c) 2013 WillowTree Apps. All rights reserved.
//

#import "MTAppDelegate.h"

#import "APStackViewController.h"
#import "APMenuViewController.h"

@implementation MTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[self window] setBackgroundColor:[UIColor whiteColor]];

    APStackViewController *stackViewController = [[APStackViewController alloc] init];
    [stackViewController setAnimationDurationProportionalToPosition:YES];
    
    APMenuViewController *menuViewController = [[APMenuViewController alloc] init];
    [stackViewController setLeftViewController:menuViewController];
    
    UINavigationController *contentNavigationController = [[UINavigationController alloc] init];
    [stackViewController setContentViewController:contentNavigationController];
    
    [[self window] setRootViewController:stackViewController];
    [[self window] makeKeyAndVisible];
    
    return YES;
}


@end
