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
#import "DetailViewController.h"
#import "ListViewController.h"
#import "ChatModel.h"
#import "ChatTableViewCell.h"
#import <objc/runtime.h>
char *const buttonKey = "buttonKey";


@interface chatMessageViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
{
    UITableView *_tableView;
    UISearchBar *searchBar;
    NSMutableArray *datasource;
}
@property (nonatomic ,strong)NSMutableArray *NameArray;
@property (nonatomic ,strong)NSMutableArray *decripArray;
@property (nonatomic ,strong)NSMutableArray *ImageNameArray;
@end

@implementation chatMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    datasource = [NSMutableArray array];
    
    NSDictionary *dict = @{@"group":
                               @[
                                   @{@"groupName":@"小学同学",@"groupCount":@"3",@"groupArray":@[
                                             @{@"name":@"小明",@"avatarURL":@"",@"shuoshuo":@"作业又没写好,唉！",@"status":@"1"},
                                             @{@"name":@"小红",@"avatarURL":@"",@"shuoshuo":@"考试不要抄我的！",@"status":@"1"},
                                             @{@"name":@"小王",@"avatarURL":@"",@"shuoshuo":@"马勒戈壁有本事放学别走！",@"status":@"0"}
                                             ]},
                                   @{@"groupName":@"初中同学",@"groupCount":@"5",@"groupArray":
                                         @[
                                             @{@"name":@"王二小",@"avatarURL":@"",@"shuoshuo":@"我家来自农村，不要欺负我",@"status":@"1"},
                                             @{@"name":@"王麻子",@"avatarURL":@"",@"shuoshuo":@"历史咯老师真漂亮！",@"status":@"1"},
                                             @{@"name":@"吴道德",@"avatarURL":@"",@"shuoshuo":@"我姓吴，法号道德",@"status":@"1"},
                                             @{@"name":@"张丝丹",@"avatarURL":@"",@"shuoshuo":@"我小名叫四蛋子，哈哈",@"status":@"0"},
                                             @{@"name":@"赵铁柱",@"avatarURL":@"",@"shuoshuo":@"我喜欢小花",@"status":@"0"}
                                             ]},
                                   @{@"groupName":@"高中同学",@"groupCount":@"3",@"groupArray":
                                         @[
                                             @{@"name":@"刘阿猫",@"avatarURL":@"",@"shuoshuo":@"我操，高考又到了",@"status":@"1"},
                                             @{@"name":@"静静",@"avatarURL":@"",@"shuoshuo":@"大家好，我是静静。",@"status":@"1"},
                                             @{@"name":@"隔壁老王",@"avatarURL":@"",@"shuoshuo":@"小样你是新来的吧！",@"status":@"0"}
                                             ]},
                                   @{@"groupName":@"大学同学",@"groupCount":@"4",@"groupArray":
                                         @[
                                             @{@"name":@"屌丝男",@"avatarURL":@"",@"shuoshuo":@"泡妞去了，回聊。",@"status":@"1"},
                                             @{@"name":@"游戏狗",@"avatarURL":@"",@"shuoshuo":@"我擦，双杀！！",@"status":@"1"},
                                             @{@"name":@"学霸",@"avatarURL":@"",@"shuoshuo":@"期末考试稳拿第一",@"status":@"1"},
                                             @{@"name":@"书呆子",@"avatarURL":@"",@"shuoshuo":@"蛋白质是怎么炼成的。。。",@"status":@"0"}]},
                                   @{@"groupName":@"同事",@"groupCount":@"3",@"groupArray":
                                         @[
                                             @{@"name":@"JAVA工程师",@"avatarURL":@"",@"shuoshuo":@"JAVA是最好的编程语言",@"status":@"1"},
                                             @{@"name":@"Android工程师",@"avatarURL":@"",@"shuoshuo":@"Android最好用，便宜耐摔！",@"status":@"1"},
                                             @{@"name":@"iOS工程师",@"avatarURL":@"",@"shuoshuo":@"iPhone手机牛逼又流畅。",@"status":@"0"}
                                             ]},
                                   @{@"groupName":@"家人",@"groupCount":@"3",@"groupArray":
                                         @[
                                             @{@"name":@"妈妈",@"avatarURL":@"",@"shuoshuo":@"今天天气好晴朗☀️，处处好风光",@"status":@"1"},
                                             @{@"name":@"爸爸",@"avatarURL":@"",@"shuoshuo":@"农家乐！",@"status":@"1"},
                                             @{@"name":@"姐姐",@"avatarURL":@"",@"shuoshuo":@"唱歌跳舞样样精通。",@"status":@"0"}
                                             ]}
                                   ]
                           };

    for (NSDictionary *groupDict in dict[@"group"]) {
        ChatModel *model = [ChatModel new];
        model.GroupName = groupDict[@"groupName"];
        model.groupCount = [groupDict[@"groupCount"]integerValue];
        model.isopend = NO;
        model.GroupFriends = groupDict[@"groupArray"];
        [datasource addObject:model];
    }
    
    
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
    [_tableView registerNib:[UINib nibWithNibName:@"ChatTableViewCell" bundle:nil] forCellReuseIdentifier:@"HomeCell"];
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_tableView.frame.size.width, 45)];
    _tableView.showsVerticalScrollIndicator = NO;
    
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    
    
    searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, ViewOfWidth - ViewOfWidth/9, 39)];
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
    return datasource.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    ChatModel *groupModel = datasource[section];
    NSInteger count = groupModel.isopend?groupModel.GroupFriends.count:0;
    return count;
    
//    if (_MessageArray == nil) {
//        return _NameArray.count;
//    }else
//    {
//        return _MessageArray.count;
//    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HomeModel *model = [[HomeModel alloc]init];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    [formatter setDateFormat:@"HH:mm"];
//    NSString *currentTime = [formatter stringFromDate:[NSDate date]];
//    NSLog(@"%@",currentTime);
//    model.Time = currentTime;
//    model.Name = _NameArray[indexPath.row];
//    model.DescripString = _decripArray[indexPath.row];
//    model.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row + 1]];
//    ChatTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
//    cell.model = model;
    
    ChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    ChatModel *groupModel = datasource[indexPath.section];
    NSDictionary *firstinfoDic = groupModel.GroupFriends[indexPath.row];
    cell.Headertitle.text = firstinfoDic[@"name"];
    if ([firstinfoDic[@"status"]isEqualToString:@"1"]) {
        cell.Linelanel.textColor = [UIColor greenColor];
        cell.Linelanel.text = @"在线";
    }else
    {
        cell.Linelanel.textColor = [UIColor lightGrayColor];
        cell.Linelanel.text = @"离线";
    }
    cell.DescripLabel.text = firstinfoDic[@"shuoshuo"];
    NSLog(@"%@",cell.DescripLabel.text);
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    sectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.8];
    ChatModel *groupModel = datasource[section];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:sectionView.bounds];
    [button setTag:section];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitle:groupModel.GroupName forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 60)];
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [sectionView addSubview:button];
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, button.frame.size.height - 1, button.frame.size.width, 1)];
    [line setImage:[UIImage imageNamed:@"line_real"]];
    [sectionView addSubview:line];
    if (groupModel.isopend) {
        UIImageView *_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44- 16)/2, 14, 16)];
        [_imgView setImage:[UIImage imageNamed:@"ico_list"]];
        [sectionView addSubview:_imgView];
        CGAffineTransform currentTransform = _imgView.transform;
        CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); //指定旋转角度
        _imgView.transform = newTransform;
        objc_setAssociatedObject(button,buttonKey, _imgView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    }else
    {
        UIImageView *_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, (44 - 16)/2, 14, 16)];
        [_imgView setImage:[UIImage imageNamed:@"ico_list"]];
        [sectionView addSubview:_imgView];
        objc_setAssociatedObject(button, buttonKey, _imgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width - 40, (44 - 20)/2, 40, 20)];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:14]];
    NSInteger onLineCount = 0;
    for (NSDictionary *friendDic in groupModel.GroupFriends) {
        if ([friendDic[@"status"]isEqualToString:@"1"]) {
            onLineCount++;
        }
    }
    [label setText:[NSString stringWithFormat:@"%ld/%ld",onLineCount,groupModel.groupCount]];
    [sectionView addSubview:label];
    return sectionView;
    
}

- (void)buttonPress:(UIButton *)sender
{
    ChatModel *groupModel = datasource[sender.tag];
    UIImageView *imageView = objc_getAssociatedObject(sender, buttonKey);
    if (groupModel.isopend) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, -M_PI/2);
            imageView.transform = newTransform;
        } completion:^(BOOL finished) {
            
        }];
    }else
    {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionCurveLinear animations:^{
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2);
            imageView.transform = newTransform;
        } completion:^(BOOL finished) {
            
        }];
    }
    
    groupModel.isopend = !groupModel.isopend;
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListViewController *detail = [ListViewController new];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detail];
    detail.Detailename = _NameArray[indexPath.row];
    [self.view.window.rootViewController presentViewController:nav animated:YES completion:nil];
    
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
