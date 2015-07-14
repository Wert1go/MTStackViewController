//
//  APMenuViewControllerConfig.h
//  MTStackViewController
//
//  Created by Юрий on 19.04.13.
//  Copyright (c) 2013 Applifto Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Kinoplan-Swift.h"

// Menu Controller
#define kBackground				[UIColor appMenuDarkColor]
#define kSelectionBackground	[UIColor colorWithRed:96.0f/255.0f green:131.0f/255.0f blue:166.0f/255.0f alpha:1.0]

#define kTopSpaceBackground     [UIColor appMenuDarkColor]


#define kSpaceTableToTop	22.0f

// Table Cell
#define kImagePadding		50
#define kTextPadding		20
#define kBadgePosition		220
#define kCellBackground		[UIColor appMenuColor].CGColor
//#define kUpperSeparator		[UIColor colorWithRed:18.0f/255.0f green:18.0f/255.0f blue:20.0f/255.0f alpha:1.0].CGColor
//#define kLowerSeparator		[UIColor colorWithRed:66.0f/255.0f green:66.0f/255.0f blue:66.0f/255.0f alpha:1.0].CGColor
#define kCellFontColor		[UIColor whiteColor]
#define kCellShadowColor	[UIColor clearColor]

#define kCellBadgeColor	[UIColor whiteColor]
// Header Cell
#define	kTextHeaderPadding	10
#define kGradientUp			[UIColor colorWithRed:31.0f/255.0f green:32.0f/255.0f blue:33.0f/255.0f alpha:1.0]
#define kGradientDown		[UIColor colorWithRed:26.0f/255.0f green:26.0f/255.0f blue:26.0f/255.0f alpha:1.0]
#define kUpperSeparator		[UIColor colorWithRed:53/255.0f green:53/255.0f blue:53/255.0f alpha:1.0].CGColor
#define kLowerSeparator		[UIColor colorWithRed:53/255.0f green:53/255.0f blue:53/255.0f alpha:1.0].CGColor
#define kFontColor			[UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0]
#define kFontShadowColor	[UIColor clearColor]

#define kCommonFontName @"HelveticaNeue"
#define kCommonFontNameBold @"HelveticaNeue"

#define kCommonFontSize 18.0f

@interface APMenuViewControllerConfig : NSObject

@end
