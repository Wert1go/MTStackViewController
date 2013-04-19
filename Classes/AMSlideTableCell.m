//
//  AMSlideTableCell.m
//  SlideOut
//
//  Created by Andrea on 14/08/12.
//  Copyright (c) 2012 Andrea Mazzini. All rights reserved.
//

#import "AMSlideTableCell.h"
#import "APMenuViewControllerConfig.h"
#import "APStackViewControllerConfig.h"

#define kBadgeFont		[UIFont fontWithName:@"Helvetica" size:12]

@implementation AMSlideTableCell

@synthesize badge = _badgeValue;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.textLabel.textColor = kCellFontColor;
		self.textLabel.shadowOffset = CGSizeMake(0, 1);
		self.textLabel.shadowColor = kFontShadowColor;
		self.textLabel.font = [UIFont fontWithName:@"Helvetica" size:14];
		
        
        UIView* selection = [[UIView alloc] initWithFrame:self.frame];
        [selection setBackgroundColor:kSelectionBackground];
        self.selectedBackgroundView = selection;
        
		self.badge = [[UILabel alloc] init];
		
		[self addSubview:self.badge];
    }
    return self;
}

- (void)layoutSubviews
{
    float height = self.frame.size.height;
	if (self.imageView.image) {
		self.imageView.frame = CGRectMake(height/2 - 30/2, height/2 - 30/2, 30, 30);
		self.textLabel.frame = CGRectMake(kImagePadding, 0, kSlideOutMenuWidth - kImagePadding, height);
	} else {
		self.textLabel.frame = CGRectMake(kTextPadding, 0, kSlideOutMenuWidth - kTextPadding, height);
	}
	
	// Set badge properties
	self.badge.font = kBadgeFont;
	self.badge.textColor = kCellFontColor;
	self.badge.adjustsFontSizeToFitWidth = YES;
	self.badge.textAlignment = UITextAlignmentCenter;
	self.badge.opaque = YES;
	self.badge.backgroundColor = [UIColor clearColor];
	self.badge.shadowOffset = CGSizeMake(0, 1);
	self.badge.shadowColor = kFontShadowColor;
	
	self.badge.layer.cornerRadius = 8;
	self.badge.layer.backgroundColor = [[UIColor blackColor] CGColor];
}

- (void)setBadgeText:(NSString*)text
{
	if (text == nil || [text isEqualToString:@""]) {
		[self.badge setAlpha:0];
	} else {
		CGSize fontSize = [text sizeWithFont:kBadgeFont];
		CGRect badgeFrame = CGRectMake(kBadgePosition - (fontSize.width + 15.0) / 2.0, 12, fontSize.width + 15.0, 20);
		self.badge.frame = badgeFrame;
		self.badge.text = text;
		[self.badge setAlpha:1];
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)drawRect:(CGRect)aRect
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(context, kCellBackground);
	CGContextFillRect(context, self.bounds);
	
	CGContextSetStrokeColorWithColor(context, kUpperSeparator);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
	
	CGContextSetStrokeColorWithColor(context, kLowerSeparator);
    CGContextBeginPath(context);
	CGContextSetLineWidth(context, 2.0);
    CGContextMoveToPoint(context, 0, self.bounds.size.height);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    CGContextStrokePath(context);
}

@end
