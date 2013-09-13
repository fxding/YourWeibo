//
//  UITweetRightInfo.m
//  Custom Cell
//
//  Created by nekle on 13-6-11.
//
//

#import "UITweetRightInfo.h"

@implementation UITweetRightInfo

@synthesize  twtUserNick;
@synthesize  twtPublishTime;
@synthesize  twtSepratorLine;
@synthesize  twtTxtContent;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        PRINT_RECT(frame);
        twtUserNick     = [[UILabel alloc] initWithFrame:CGRectZero];
        twtPublishTime  = [[UILabel alloc] initWithFrame:CGRectZero];
        twtSepratorLine = [[UILabel alloc] initWithFrame:CGRectZero];
        twtTxtContent   = [[UILabel alloc] initWithFrame:CGRectZero];
        
        // 获得父 view frame.
        CGRect superFrame = self.frame;
        
        // 设置昵称位置
        CGRect postionRect = CGRectMake(1, 1, 50, 20);
        PRINT_RECT(postionRect);
        twtUserNick.frame = postionRect;
        twtUserNick.font = [UIFont fontWithName:@"CourierNewPSMT" size:20];
        [self addSubview:twtUserNick];
        
        // publish time
        postionRect = CGRectMake(superFrame.size.width-60, 1, 60, 20);
        PRINT_RECT(postionRect);
        twtPublishTime.frame = postionRect;
        twtPublishTime.font = [UIFont fontWithName:@"CourierNewPSMT" size:15];
        twtPublishTime.textColor = [UIColor colorWithRed:227/255 green:76/255 blue:255/255 alpha:1];
        [self addSubview:twtPublishTime];
        
        // seperator line
        postionRect = CGRectMake(-5, 22, superFrame.size.width, 2);
        PRINT_RECT(postionRect);
        twtSepratorLine.frame = postionRect;
        twtSepratorLine.backgroundColor = [UIColor blueColor];
        [self addSubview:twtSepratorLine];
        
        // content
        postionRect = CGRectMake(2, postionRect.origin.y+1, superFrame.size.width, 60);
        PRINT_RECT(postionRect);
        twtTxtContent.frame = postionRect;
        [self addSubview:twtTxtContent];
    }

    return self;
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
