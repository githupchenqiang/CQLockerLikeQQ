//
//  TabbarViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/4/26.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "TabbarViewController.h"
#import "HomeViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "AppDelegate.h"
#import "BaseViewController.h"
@interface TabbarViewController ()
@end

@implementation TabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetTabarView];

}

- (void)SetTabarView
{
    UINavigationController *homeNC = [[UINavigationController alloc]initWithRootViewController:[HomeViewController new]];
    homeNC.tabBarItem.title = @"信息";
//    [homeNC.navigationBar setBarTintColor:[UIColor redColor]];

    UINavigationController *SecondNC = [[UINavigationController alloc]initWithRootViewController:[SecondViewController new]];
    SecondNC.tabBarItem.title = @"联系人";

    UINavigationController *ThirdNC = [[UINavigationController alloc]initWithRootViewController:[ThirdViewController new]];
    ThirdNC.tabBarItem.title = @"发现";
    
    
//    UINavigationController *FourNC = [[UINavigationController alloc]initWithRootViewController:[FourViewController new]];
//    FourNC.tabBarItem.title = @"我的";
    self.tabBar.tintColor = [UIColor redColor]; /*ios8以后图片不需要渲染
                                                 *设置tintColor直接改变文字和图片的颜色
                                                 *
                                                 *
                                                 */
    
    
    HomeViewController *HomeVC = [HomeViewController new];
    HomeVC.tabBarItem.title = @"信息";
    
    SecondViewController *second = [SecondViewController new];
    second.tabBarItem.title = @"联系人";
    ThirdViewController *third = [ThirdViewController new];
    third.tabBarItem.title = @"发现";
    FourViewController *four = [FourViewController new];
    four.tabBarItem.title = @"我的";
    

//    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    self.viewControllers = @[homeNC,SecondNC,ThirdNC];
//    self.viewControllers = @[HomeVC,second,third,four];
    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    AppDelegate *tempapplegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempapplegate.bas setPanEnabled:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    AppDelegate *tempAppleDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [tempAppleDelegate.bas setPanEnabled:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
