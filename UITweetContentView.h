//
//  UITweetContentView.h
//  Custom Cell
//
//  Created by nekle on 13-6-11.
//
//

#import <UIKit/UIKit.h>

#import "UITweetLeftInfo.h"
#import "UITweetRightInfo.h"

@interface UITweetContentView : UIView

@property(strong, nonatomic)    UITweetLeftInfo *twtLeftInfo;
@property(strong, nonatomic)    UITweetRightInfo *twtRightInfo;

@end
