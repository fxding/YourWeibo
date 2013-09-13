//
//  ViewController.h
//  Custom Cell
//
//  Created by Yang on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *listData;
@property (strong, nonatomic) NSArray *dataList;
@property (strong, nonatomic) NSArray *imageList;
@end
