//
//  HomeTableViewCell.h
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/6/29.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *HeadImage;
@property (weak, nonatomic) IBOutlet UILabel *NickName;
@property (weak, nonatomic) IBOutlet UILabel *MessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
- (void)setModelWithHome:(HomeModel *)HomeModel;



@end
