//
//  RootViewController.m
//  Custom Cell
//
//  Created by nekle on 13-6-15.
//
//

#import "RootViewController.h"

#import "ViewController.h"
#import "NoneViewController.h"
#import "TopTabBar.h"


@interface RootViewController ()

@end

@implementation RootViewController

@synthesize topBarView;
@synthesize bottomTabBarController;

- (id) initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        
        self.view.frame = frame;
        
        bottomTabBarController = [[UITabBarController alloc] init];
        topBarView = [[TopTabBar alloc] initWithFrame:self.view.frame];
        
        UIViewController *vc1, *vc2;
        vc1 = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
        vc2 = [[NoneViewController alloc] initWithNibName:@"NoneViewController" bundle:nil];
        
        vc1.title = @"Controller1";
        vc2.title = @"Controller2";
        
        [vc1.tabBarItem setImage:[UIImage imageNamed:@"distance"]];
        [vc2.tabBarItem setImage:[UIImage imageNamed:@"reverse"]];
        
        
        bottomTabBarController.viewControllers = [[NSArray alloc] initWithObjects:vc1, vc2,nil];
        
        
        [self.view addSubview:bottomTabBarController.view];
        [self.view addSubview:topBarView];
        
        //NSLog(@"[root view] xy[%f, %f], wh[%f, %f]\n", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    }

    return  self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    NSLog(@"tab %d seleced\n", 12);
}



@end
