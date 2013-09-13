//
//  UITweetContentView.m
//  Custom Cell
//
//  Created by nekle on 13-6-11.
//
//

#import "UITweetContentView.h"

@implementation UITweetContentView

@synthesize  twtLeftInfo;
@synthesize  twtRightInfo;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        PRINT_RECT(frame);
        // Initialization code
        CGRect postionRect = CGRectMake(2, 2, 50, 100);
        
        twtLeftInfo = [[UITweetLeftInfo alloc] initWithFrame:postionRect];
        
        postionRect = CGRectMake(50, 2, frame.size.width-50, 100);
        twtRightInfo = [[UITweetRightInfo alloc] initWithFrame:postionRect];
        
       
        [self addSubview:twtRightInfo];
        [self addSubview:twtLeftInfo];
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
