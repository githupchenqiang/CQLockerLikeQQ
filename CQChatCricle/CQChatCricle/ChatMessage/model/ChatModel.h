//
//  ChatModel.h
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/8/15.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatModel : NSObject
@property (nonatomic ,assign)BOOL isopend;
@property (nonatomic ,strong)NSString *GroupName;
@property (nonatomic ,strong)NSString *UserName;
@property (nonatomic ,strong)NSArray *GroupFriends;
@property (nonatomic ,assign)NSInteger groupCount;
@end
