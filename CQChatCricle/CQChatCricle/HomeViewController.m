//
//  HomeViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/4/26.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "HomeViewController.h"
#import <AVOSCloudIM/AVOSCloudIM.h>
#import <AVOSCloud/AVOSCloud.h>
#import "SearchViewController.h"
#import "AppDelegate.h"
#import "BaseViewController.h"
#import "TelephoneViewController.h"
#import "chatMessageViewController.h"



@interface HomeViewController ()
{
    
    chatMessageViewController *_ChatMessage;
    TelephoneViewController *_tele;

}

@end

@implementation HomeViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"信息"];
//        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = image;
    }
    return self;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

    _UserHearder = [UIButton buttonWithType:UIButtonTypeCustom];
    _UserHearder.frame = CGRectMake(0, 0, 40, 40);
    UIImage *image = [UIImage imageNamed:@"Header"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_UserHearder setBackgroundImage:image forState:UIControlStateNormal];
    [_UserHearder addTarget:self action:@selector(HearderAction) forControlEvents:UIControlEventTouchDown];
    _UserHearder.layer.cornerRadius = 20;
    _UserHearder.layer.masksToBounds = YES;
    _UserHearder.backgroundColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_UserHearder];
//    self.navigationItem.title = @"消息";
    
    
    //设置分段控制器
    NSArray *arr = [NSArray arrayWithObjects:@"消息",@"电话", nil];
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:arr];
    segment.frame = CGRectMake(ViewOfWidth/2-50, 27, 100, 30);
    [segment setTitle:@"消息" forSegmentAtIndex:0];
    [segment setTitle:@"电话" forSegmentAtIndex:1];
    
    [segment addTarget:self action:@selector(SegmentAction:) forControlEvents:UIControlEventValueChanged];
//    segment.center = self.navigationController.view.center;
    segment.selectedSegmentIndex = 0;
    [self.navigationController.view addSubview:segment];
    
    //设置Navigation右视图
    UIImage *RightImage = [UIImage imageNamed:@"Right"];
    RightImage = [RightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIButton *RightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [RightButton setBackgroundImage:RightImage forState:UIControlStateNormal];
    RightButton.frame = CGRectMake(0, 0,30, 30);
    [RightButton addTarget:self action:@selector(RightButtonAction) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:RightButton];
    
    
    _ChatMessage = [chatMessageViewController new];
    [self.view addSubview:_ChatMessage.view];
    [self addChildViewController:_ChatMessage];
//    [self CreatMessageTable];
//    [self CreatLeftItem];
    
}

- (void)SegmentAction:(UISegmentedControl *)sengment
{
    if (sengment.selectedSegmentIndex == 0) {
        [_tele.view removeFromSuperview];
        [self.view insertSubview:_ChatMessage.view atIndex:0];
        
    }else if (sengment.selectedSegmentIndex == 1)
    {   _tele = [TelephoneViewController new];
        [self.view addSubview:_tele.view];
         [self addChildViewController:_tele];
        [_ChatMessage.view removeFromSuperview];
        [self.view insertSubview:_tele.view atIndex:1];
    
    }
    
}



- (void)RightButtonAction
{
    
}


- (void)HearderAction
{
    AppDelegate *apple = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (apple.bas.closed) {
        
        [apple.bas openLeftView];
//        UserHearder.alpha = 0;
    }
    else
    {
        [apple.bas closeLeftView];
//        UserHearder.alpha = 1;
        
    }
    
}




//创建Navigation的左边按钮
- (void)CreatLeftItem
{
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    self.navigationItem.leftBarButtonItem  = imageView;
    UIButton *Leftbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    Leftbutton.frame = CGRectMake(8, 22,40, 40);
    Leftbutton.backgroundColor = [UIColor orangeColor];
    [Leftbutton addTarget:self action:@selector(LeftButtonAction:) forControlEvents:UIControlEventTouchDown];
    Leftbutton.layer.cornerRadius = 20;
    Leftbutton.layer.masksToBounds = YES;
    [self.navigationController.view addSubview:Leftbutton];
}
- (void)LeftButtonAction:(UIButton *)Button
{
    
    NSLog(@"正在执行");
    HomeViewController *homeView = [HomeViewController new];
    homeView.view.frame = CGRectMake(ViewOfWidth - 40, 0, ViewOfWidth, ViewOfHeight);

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
