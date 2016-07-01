//
//  chatMessageViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/7/1.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "chatMessageViewController.h"
#import "SearchViewController.h"
#import "HomeTableViewCell.h"
#import "HomeModel.h"
#import "DetailChatTableViewController.h"

@interface chatMessageViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    UISearchBar *searchBar;
}
@property (nonatomic ,strong)NSMutableArray *NameArray;
@property (nonatomic ,strong)NSMutableArray *decripArray;
@property (nonatomic ,strong)NSMutableArray *ImageNameArray;
@end

@implementation chatMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _NameArray = [NSMutableArray arrayWithObjects:@"拿破仑",@"华盛顿",@"斯大林",@"毛泽东",@"金日成",@"艾森豪威尔",@"麦克马洪",@"麦克阿瑟", nil];
    _decripArray = [NSMutableArray arrayWithObjects:@"战神的世界,你不会懂,犹太不灭,马不归",@"从罪恶的英国将人民解救出来，带领爱好自由的人类建立新的家园",@"将社会主义发扬光大,同资本主义战斗到底",@"东风压倒西风，一切资本主义都是纸老虎",@"国家不灭，王朝不亡",@"战斗永不停息，名族勇往直前",@"殖民地的结束，是战争的消亡与变形",@"不是自己能力很强，而是能让每个人能力发挥最强", nil];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatMessageTable];
    
}

//创建TableView
- (void)CreatMessageTable
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_tableView.frame.size.width, 45)];
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ViewOfWidth - ViewOfWidth/9, 39)];
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
        return _NameArray.count;
        
        
    }else
    {
        return _MessageArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeModel *model = [[HomeModel alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
    NSLog(@"%@",currentTime);
    model.Time = currentTime;
    model.Name = _NameArray[indexPath.row];
    model.DescripString = _decripArray[indexPath.row];
    model.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
    HomeTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailChatTableViewController *detail = [DetailChatTableViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detail];
    detail.detailName = _NameArray[indexPath.row];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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
