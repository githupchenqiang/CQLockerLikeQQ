//
//  SecondViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/4/26.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIImage *image = [UIImage imageNamed:@"联系人"];
//        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.tabBarItem.image = image;
    }
    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationItem.title = @"联系人";
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
    
    
    UIButton *RightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [RightButton setTitle:@"添加" forState:UIControlStateNormal];
    RightButton.frame = CGRectMake(0, 0,40, 40);
    [RightButton setTintColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:239/255.0 alpha:1]];
    [RightButton addTarget:self action:@selector(RightButtonAction:) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:RightButton];
    
    
    
    
    
}

- (void)RightButtonAction:(UIButton *)button
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
