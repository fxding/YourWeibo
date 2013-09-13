//
//  TopTabBar.m
//  Custom Cell
//
//  Created by nekle on 13-6-13.
//
//

#import "TopTabBar.h"

@implementation TopTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIColor *bgColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"topbar.png"]];
         self.backgroundColor = bgColor;
        
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 90);
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
