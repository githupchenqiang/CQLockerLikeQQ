//
//  TelephoneViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/7/1.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "TelephoneViewController.h"
#import "SearchViewController.h"
#import "TeleTableViewCell.h"
#import "TeleSelectViewController.h"

@interface TelephoneViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UITableView *teleTable;
    UISearchBar *teleSearch;
}
@end

@implementation TelephoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatMessageTable];
}


- (void)CreatMessageTable
{
    teleTable = [[UITableView alloc]initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    teleTable.delegate = self;
    teleTable.dataSource = self;
    [teleTable registerNib:[UINib nibWithNibName:@"TeleTableViewCell" bundle:nil] forCellReuseIdentifier:@"TeleCell"];
    [teleTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TeleOneCell"];
//    [teleTable registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    teleTable.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,teleTable.frame.size.width, 45)];
    teleTable.showsVerticalScrollIndicator = NO;
    teleTable.bounces = YES;
    [self.view addSubview:teleTable];
    
    teleSearch = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ViewOfWidth - ViewOfWidth/9, 39)];
    //    searchBar.backgroundColor = [UIColor grayColor];
    teleSearch.delegate = self;
    teleSearch.searchBarStyle = UISearchBarStyleMinimal;
    teleSearch.center = teleTable.tableHeaderView.center;
    [teleTable.tableHeaderView addSubview:teleSearch];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    SearchViewController *searchVC = [SearchViewController new];
    [self presentViewController:searchVC animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    if (section == 0) {
        return 2;
        
    }else
    {
        return 10;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ViewOfWidth, 20)];
    view.backgroundColor = [UIColor colorWithRed:195/255.0 green:195/255.0 blue:193/255.0 alpha:0.4];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 20)];
    label.font = [UIFont systemFontOfSize:13];
    [view addSubview:label];
    if (section == 1) {
    label.text = @"通话记录";
    }
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        
        return 0;
    }else if (section == 1)
    {
        return 20;
        
    }else
    {
        return 0;
        
    }
        
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        TeleTableViewCell *Onecell = [tableView dequeueReusableCellWithIdentifier:@"TeleCell" forIndexPath:indexPath];
        
        switch (indexPath.row) {
            case 0:
                Onecell.imageView.image = [UIImage imageNamed:@"电话-1"];
                Onecell.textLabel.text = @"电话黄页";
                break;
                
                case 1:
                Onecell.imageView.image = [UIImage imageNamed:@"通讯录"];
                Onecell.textLabel.text = @"通讯录";
                
                break;
                
            default:
                break;
        }
        
        return Onecell;
        
    }else if (indexPath.section == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeleOneCell" forIndexPath:indexPath];
        return cell;
    }else
    {
        return nil;
        
    }
    

    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return 50;
    }else if (indexPath.section == 1)
    {
        return 60;
    }else
    {
        return 0;
    }
    
    
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0 ) {
        TeleSelectViewController *teleSelect = [[TeleSelectViewController alloc]init];
        [self.navigationController presentViewController:teleSelect animated:YES completion:nil];
        
    }
    
}



- (void)viewDidLayoutSubviews
{
    if ([teleTable respondsToSelector:@selector(setSeparatorInset:)]) {
        [teleTable setSeparatorInset:UIEdgeInsetsZero];
    }
    
    
    if ([teleTable respondsToSelector:@selector(setLayoutMargins:)]) {
        [teleTable setLayoutMargins:UIEdgeInsetsZero];
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
