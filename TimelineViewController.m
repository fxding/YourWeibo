//
//  ViewController.m
//  Custom Cell
//
//  Created by Yang on 12-6-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "UIImage+wiRoundedRectImage.h"
#import "UITweetContentView.h"

#import "TopTabBar.h"


@implementation ViewController
@synthesize listData;
@synthesize dataList;
@synthesize imageList;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //self.title = @"好友";
   
    
    //加载plist文件的数据和图片
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"friendsInfo" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
    NSMutableArray *tmpImageArray = [[NSMutableArray alloc] init];
    for (int i=0; i<[dictionary count]; i++) {
        NSString *key = [[NSString alloc] initWithFormat:@"%i", i+1];
        NSDictionary *tmpDic = [dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
        
        NSString *imageUrl = [[NSString alloc] initWithFormat:@"%i.png", i+1];
        UIImage *image = [UIImage imageNamed:imageUrl];
        [tmpImageArray addObject:image];
    }
    self.dataList = [tmpDataArray copy];
    self.imageList = [tmpImageArray copy];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.listData = nil;
    self.dataList = nil;
    self.imageList = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark -
#pragma mark Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;//[self.dataList count];
}


-(IBAction)imageViewClick:(id)sender{

    NSLog(@"img cliecked\n");

}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cell %ld is selected\n", (long)indexPath.row);

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return rand()%100+1;
    return  rand()%100+100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CustomCellIdentifier = [NSString stringWithFormat:@"Cell%d%d", [indexPath section], [indexPath row]];
    /*
    static BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib *nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CustomCellIdentifier];
        nibsRegistered = YES;
    }
    */
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
    if (cell == nil) { 
        cell = [[CustomCell alloc]
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:CustomCellIdentifier];
    }
    /*
     NSUInteger row = [indexPath row];
     NSDictionary *rowData = [self.dataList objectAtIndex:row];
    
     cell.name = [rowData objectForKey:@"name"];
     cell.dec = [rowData objectForKey:@"dec"];
     cell.loc = [rowData objectForKey:@"loc"];
     //cell.image = [imageList objectAtIndex:row];
    //UITableViewCell *tc = [[UITableViewCell alloc] init];
    */
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomCellIdentifier];
//    if (nil == cell)
//    {
//        cell = [[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CustomCellIdentifier];
//    
//    }
    
    CGRect cellFrame = [cell frame];
    //NSLog(@"cell frame[%@]\n", NSStringFromCGRect( cellFrame));
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    label.text = @"1234121212qweqewerwewer";
    [label setLineBreakMode:UILineBreakModeWordWrap];
    //[label setMinimumFontSize:FONT_SIZE];
    [label setNumberOfLines:0];
    
    cellFrame.origin = CGPointMake(0, 0);
    CGRect lRect = CGRectMake(60, 29, 100, 50);
    
    label.frame = lRect;
    //[cell.contentView addSubview:label];
    
    UIImage *image  = [UIImage imageNamed:@"1"];
    
    
    CGSize size = CGSizeMake(0, 0);
    size.height = image.size.height-5;
    size.width  = image.size.width-5;
    
    //UIImage *roundedImg = [UIImage createRoundedRectImage:image size:size radius:22];
    
    /*
    UIImageView *img = [[UIImageView alloc] initWithImage: image];
    
    img.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick:)];
    singleTap.numberOfTapsRequired = 1;
    singleTap.numberOfTouchesRequired = 1;
    //singleTap.delegate = self;
    
    [img addGestureRecognizer:singleTap];

    cellFrame.origin = CGPointMake(0, 0);
    CGRect imgRect = CGRectMake(5, 3, 44, 44);
    img.frame = imgRect;
    */
    
    
    
    //[cell.contentView addSubview:img];
    UITweetContentView *content = [[UITweetContentView alloc] initWithFrame:cell.contentView.frame];

    content.twtLeftInfo.twtUserImg.image = image;//roundedImg;
    
    content.twtRightInfo.twtUserNick.text = @"Name";
    content.twtRightInfo.twtPublishTime.text = @"06-11";
    content.twtRightInfo.twtTxtContent.text = @"这是微博内容!";
    
    [cell.contentView addSubview:content];
    
    
    //TopTabBar *topbar = [[TopTabBar alloc] initWithFrame:cellFrame];
    
    //[cell.contentView addSubview:topbar];
    
    
    //[label release];
    return cell;
}

#pragma mark Table Delegate Methods

- (NSIndexPath *)tableView:(UITableView *)tableView 
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath { 
    return nil;
}

@end
