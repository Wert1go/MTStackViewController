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

#define kBadgeFont		[UIFont systemFontOfSize:18]
@interface AMSlideTableCell ()

@property (nonatomic, strong) UIImageView *labelBackground;

@end

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
        self.textLabel.font = [UIFont systemFontOfSize:kCommonFontSize];
        
        self.badge = [[UILabel alloc] init];
        [self addSubview:self.badge];
        
        UIView* selection = [[UIView alloc] initWithFrame:self.frame];
        [selection setBackgroundColor:kSelectionBackground];
        self.selectedBackgroundView = selection;
        self.showTopBorder = NO;
        self.showBottomBorder = YES;
        self.showFullSize = NO;
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    float height = self.frame.size.height;
	if (self.imageView.image) {
		self.imageView.frame = CGRectMake(height/2 - 30/2, height/2 - 30/2, 30, 30);
        self.imageView.contentMode = UIViewContentModeCenter;
		self.textLabel.frame = CGRectMake(kImagePadding, 0, kSlideOutMenuWidth - kImagePadding, height);
	} else {
		self.textLabel.frame = CGRectMake(kTextPadding, 0, kSlideOutMenuWidth - kTextPadding, height);
	}
    
    CGRect badgeFrame = CGRectMake(self.frame.size.width - 42, height/2 - 24/2, 31, 24);
    self.badge.frame = badgeFrame;
	
	// Set badge properties
	self.badge.font = kBadgeFont;
	//self.badge.textColor = [UIColor colorWithRed:83.0f/255.0f green:83.0f/255.0f blue:83.0f/255.0f alpha:1.0f];
    self.badge.textColor = kCellBadgeColor;
	self.badge.adjustsFontSizeToFitWidth = YES;
	self.badge.textAlignment = NSTextAlignmentCenter;
    self.badge.backgroundColor = [UIColor clearColor];
}

- (void)setBadgeText:(NSString*)text
{
	if (!text || [text isEqualToString:@""] || [text isEqualToString:@"0"]) {
		self.badge.hidden = YES;
	} else {
		self.badge.text = text;
		self.badge.hidden = NO;
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
	
    if (self.showTopBorder) {
        CGContextSetStrokeColorWithColor(context, kUpperSeparator);
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, self.showFullSize ? 0 : 44, 0);
        CGContextAddLineToPoint(context, self.bounds.size.width, 0);
        CGContextStrokePath(context);
    }
	
    if(self.showBottomBorder) {
        CGContextSetStrokeColorWithColor(context, kLowerSeparator);
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 1.0);
        CGContextMoveToPoint(context, self.showFullSize ? 0 : 44, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextStrokePath(context);
    }
}

@end
