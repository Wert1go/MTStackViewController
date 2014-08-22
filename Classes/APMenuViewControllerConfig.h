//
//  APMenuViewControllerConfig.h
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// Menu Controller
#define kBackground             [UIColor clearColor]	//[UIColor colorWithRed:45.0f/255.0f green:45.0f/255.0f blue:45.0f/255.0f alpha:1.0]
#define kSelectionBackground	[UIColor colorWithRed: 171.0f/255.0f green:171.0f/255.0f blue:171.0f/255.0f alpha:1.0]

// Table Cell
#define kImagePadding		50
#define kTextPadding		20
#define kBadgePosition		220
#define kCellBackground		[UIColor colorWithRed:45.0f/255.0f green:45.0f/255.0f blue:45.0f/255.0f alpha:1.0].CGColor
#define kUpperSeparator		[UIColor clearColor].CGColor
#define kLowerSeparator		[UIColor clearColor].CGColor
#define kCellFontColor		[UIColor blackColor];
#define kCellShadowColor	[UIColor clearColor]

// Header Cell
#define	kTextHeaderPadding	10
#define kGradientUp			[UIColor colorWithRed:31.0f/255.0f green:32.0f/255.0f blue:33.0f/255.0f alpha:1.0]
#define kGradientDown		[UIColor colorWithRed:31.0f/255.0f green:32.0f/255.0f blue:33.0f/255.0f alpha:1.0]
//#define kUpperSeparator		[UIColor blackColor]   //[UIColor colorWithRed:18.0f/255.0f green:18.0f/255.0f blue:20.0f/255.0f alpha:1.0].CGColor
//#define kLowerSeparator		[UIColor colorWithRed:66.0f/255.0f green:66.0f/255.0f blue:66.0f/255.0f alpha:1.0].CGColor
#define kFontColor			[UIColor blackColor]
#define kFontShadowColor	[UIColor clearColor]

#define kCommonFontName @"OpenSans-Light"
#define kCommonFontNameBold @"OpenSans-Light"

#define kCommonFontSize 16.0f

@interface APMenuViewControllerConfig : NSObject

@end
