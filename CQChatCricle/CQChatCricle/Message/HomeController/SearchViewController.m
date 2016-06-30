//
//  SearchViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/6/29.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "SearchViewController.h"
#import "TabbarViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UISearchBar *search;
    UITableView *SearchTable;
    NSMutableArray *searchDaraAarray;
    
 
}
@end
@implementation SearchViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 20, ViewOfWidth, 44)];
    view.layer.borderColor = [UIColor blackColor].CGColor;
    view.layer.borderWidth = 0.2;
    [self.view addSubview:view];

    search = [[UISearchBar alloc]initWithFrame:CGRectMake(10,0, ViewOfWidth - ViewOfWidth/8, 55)];
//    search.center = view.center;
    search.searchBarStyle = UISearchBarStyleMinimal;
    search.placeholder = @"搜索";
    search.delegate = self;
    search.showsCancelButton = YES;
    [view addSubview:search];
    
    SearchTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 44, ViewOfWidth, ViewOfHeight) style:UITableViewStylePlain];
    SearchTable.delegate = self;
    SearchTable.dataSource = self;
    [SearchTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"searchCell"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchDaraAarray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [SearchTable dequeueReusableCellWithIdentifier:@"searchCell"];
    
    return cell;
    
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [search resignFirstResponder];
//    [self.view endEditing:YES];
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
