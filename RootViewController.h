//
//  RootViewController.h
//  Custom Cell
//
//  Created by nekle on 13-6-15.
//
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UITabBarControllerDelegate>


@property (strong, nonatomic) UITabBarController *bottomTabBarController;


@property (strong, nonatomic) UIView * topBarView;


- (id) initWithFrame:(CGRect)frame;

@end
