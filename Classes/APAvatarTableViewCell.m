//
//  APAvatarTableViewCell.m
//  Kinoplan
//
//  Created by Alex Golutvin on 28.08.14.
//  Copyright (c) 2014 Applifto Inc. All rights reserved.
//

#import "APAvatarTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
//#import "Kinoplan-Swift.h"
#import "APMenuViewControllerConfig.h"

@implementation APAvatarTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        UIView* selection = [[UIView alloc] initWithFrame:self.contentView.frame];
        [selection setBackgroundColor:kSelectionBackground];
        
        self.selectedBackgroundView = selection;
        
    }
    return self;
}

//- (void)awakeFromNib
//{
//    // Initialization code
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAvatarWithURLString:(NSString *)url {
    UIImage *avatarPlaceholder = [UIImage imageNamed:@"user_placeholder_gray"];
    
    if (url && url.length > 0) {
        NSURL *imageUrl= [[NSURL alloc] initWithString:url];
        __typeof(self) __weak w_self = self;
        [self.avatarImageView sd_setImageWithURL:imageUrl
                           placeholderImage:avatarPlaceholder
                                  completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                      if (image) {
                                          if (cacheType == SDImageCacheTypeNone) {
                                              w_self.avatarImageView.alpha = 0.0;
                                              w_self.avatarImageView.image = image;
                                              w_self.avatarImageView.layer.cornerRadius = w_self.avatarImageView.frame.size.width / 2;
                                              w_self.avatarImageView.clipsToBounds = YES;
                                              [UIView animateWithDuration:0.4 animations:^{
                                                  w_self.avatarImageView.alpha = 1.0;
                                              }];
                                          } else {
                                              w_self.avatarImageView.image = image;
                                              w_self.avatarImageView.layer.cornerRadius = w_self.avatarImageView.frame.size.width / 2;
                                              w_self.avatarImageView.clipsToBounds = YES;
                                          }
                                          w_self.avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
                                      }
                                  }];
    } else {
        self.avatarImageView.image = avatarPlaceholder;
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
        self.avatarImageView.clipsToBounds = YES;
    }
}
@end
