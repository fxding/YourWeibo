//
//  UITweetTableCell.m
//  YourWeibo
//
//  Created by nekle on 13-7-25.
//  Copyright (c) 2013年 nekle. All rights reserved.
//

#import "UITweetTableCell.h"

@implementation UITweetTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
