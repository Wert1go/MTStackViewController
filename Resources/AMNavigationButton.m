//
//  AMNavigationButton.m
//  Kinoplan
//
//  Created by Alex Golutvin on 16.04.14.
//  Copyright (c) 2014 Applifto Inc. All rights reserved.
//

#import "AMNavigationButton.h"

@implementation AMNavigationButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (UIEdgeInsets)alignmentRectInsets {
    // NSLog(@"!2flksdfngl;sdf");
    UIEdgeInsets insets;
    if (/*IF_ITS_A_LEFT_BUTTON*/ self.isLeftItem) {
        insets = UIEdgeInsetsMake(0, (isIOS7)?15.0f:4.0f, 0, 0);
    }
    else { // IF_ITS_A_RIGHT_BUTTON
//        insets = UIEdgeInsetsMake(0, 0, 0, 9.0f);
    }
    return insets;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
