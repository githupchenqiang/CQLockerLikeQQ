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

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    UISearchBar *searchBar;
   
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

    self.navigationItem.title = @"消息";
    
    
    [self CreatMessageTable];
//    [self CreatLeftItem];
    
}

//
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

//创建TableView
- (void)CreatMessageTable
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_tableView.frame.size.width, 45)];
    [self.view addSubview:_tableView];
 
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ViewOfWidth - ViewOfWidth/4, 39)];
//    searchBar.backgroundColor = [UIColor grayColor];
    searchBar.delegate = self;
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.center = _tableView.tableHeaderView.center;
    [_tableView.tableHeaderView addSubview:searchBar];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    SearchViewController *searchVC = [SearchViewController new];
    [self presentViewController:searchVC animated:YES completion:nil];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_MessageArray == nil) {
        return 10;
        
    }else
    {
        return _MessageArray.count;
        
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
//    cell.textLabel.text = @"信息";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}



- (void)viewDidLayoutSubviews
{
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [searchBar resignFirstResponder];
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
