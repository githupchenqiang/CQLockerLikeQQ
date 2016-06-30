//
//  LeftViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/6/29.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
}
@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"back"];
    [self.view addSubview:imageView];
    
    _tableView = [[UITableView alloc]init];
    self.tableView = _tableView;
    _tableView.frame = CGRectMake(0, ViewOfHeight/5, ViewOfWidth, ViewOfHeight);
    _tableView.dataSource = self;
    _tableView.delegate = self;
//    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"开通会员";
        
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"QQ钱包";
        
    }else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"个人装扮";
        
    }else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"我的收藏";
        
    }else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"我的相册";
        
    }else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"我的文件";
    }
   
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 180;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,_tableView.bounds.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    return view;
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
