//
//  TeleSelectViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/7/4.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "TeleSelectViewController.h"

@interface TeleSelectViewController ()

@end

@implementation TeleSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0,25, 26);
    [button setTintColor:[UIColor colorWithRed:0/255.0 green:168/255.0 blue:239/255.0 alpha:1]];
    [button addTarget:self action:@selector(BackButton) forControlEvents:UIControlEventTouchDown];
    [button setBackgroundImage:[UIImage imageNamed:@"向左"] forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0,0,-0, -button.imageView.bounds.size.width);
    //    [button setTitle:@"返回" forState:UIControlStateNormal];
    
    button.titleEdgeInsets = UIEdgeInsetsMake(0,25,-0, 0);

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)BackButton
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
