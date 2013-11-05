//
//  AMSlideTableHeader.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableHeader.h"
#import "APMenuViewControllerConfig.h"
#import "APStackViewControllerConfig.h"

@implementation AMSlideTableHeader

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:13.0f];
        _titleLabel.textColor = kFontColor;
        _titleLabel.shadowColor = kCellShadowColor;
        _titleLabel.shadowOffset = CGSizeMake(0, 1);
        [self addSubview:_titleLabel];
    }
    return self;
}

-(void) layoutSubviews
{
    _titleLabel.frame = CGRectMake(kTextHeaderPadding, 0, kSlideOutMenuWidth - kTextHeaderPadding, self.bounds.size.height);
}

- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, kCellBackground);
	CGContextFillRect(context, self.bounds);
	
    if (self.showTopBorder) {
        CGContextSetStrokeColorWithColor(context, kUpperSeparator);
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, self.bounds.size.width, 0);
        CGContextStrokePath(context);
    }
	
    if(self.showBottomBorder) {
        CGContextSetStrokeColorWithColor(context, kLowerSeparator);
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, 0, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextStrokePath(context);
    }
}

@end
