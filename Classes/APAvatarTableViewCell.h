//
//  APAvatarTableViewCell.h
//  Kinoplan
//
//  Created by Alex Golutvin on 28.08.14.
//  Copyright (c) 2014 Applifto Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APAvatarTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *postLabel;


- (void)setAvatarWithURLString:(NSString *)url;

@end
