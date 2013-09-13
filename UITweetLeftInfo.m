//
//  UITweetLeftInfo.m
//  Custom Cell
//
//  Created by nekle on 13-6-11.
//
//

#import "UITweetLeftInfo.h"

#import "UIImage+wiRoundedRectImage.h"

@implementation UITweetLeftInfo

@synthesize  twtUserImg;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        PRINT_RECT(frame);
        twtUserImg = [[UIImageView alloc] initWithFrame:CGRectZero];

        twtUserImg.frame = CGRectMake(frame.origin.x+2, frame.origin.y+2, 44, 44);
        PRINT_RECT(twtUserImg.frame);
        [self addSubview:twtUserImg];
        // opaque 必须设置为 no, 不然 会出现黑色背景.
        self.opaque = NO;
    }
    

    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*
- (void)drawRect:(CGRect)rect
{
   
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextClearRect(ctx, rect);
    
    CGContextSetLineWidth(ctx, 4.0);
   
    
    float angle_start = [UIImage radians:0.0];
    float angle_end   = [UIImage radians:360.0];
    
    CGPoint center = twtUserImg.center;
    center.x = center.x - 0.5;
    
    [UIImage drawArcCtx:ctx atPoint:center whitR:twtUserImg.frame.size.width/2 start:angle_start end:angle_end color:[UIColor grayColor]];

}
*/

@end
