//
//  ListViewController.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/8/15.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
[self setDisplayConversationTypes:@[@(ConversationType_PRIVATE),
                                    @(ConversationType_DISCUSSION),
                                    @(ConversationType_GROUP),
                                    @(ConversationType_APPSERVICE),
                                    @(ConversationType_SYSTEM)]];
    
    //设置需要将哪些类型的会话在会话列表中聚合显示
    [self setCollectionConversationType:@[@(ConversationType_DISCUSSION),
                                          @(ConversationType_GROUP)]];
//    ListViewController *chatList = [ListViewController new];
//    [self.navigationController pushViewController:chatList animated:YES];
//    
    


}
//重写RCConversationListViewController的onSelectedTableRow事件
- (void)onSelectedTableRow:(RCConversationModelType)conversationModelType conversationModel:(RCConversationModel *)model atIndexPath:(NSIndexPath *)indexPath
{
    RCConversationViewController *conversationVC = [RCConversationViewController new];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.title = @"";
    [self.navigationController pushViewController:conversationVC animated:YES];
    
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
