//
//  ChatTableViewCell.h
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/8/15.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *UserImage;
@property (weak, nonatomic) IBOutlet UILabel *Headertitle;
@property (weak, nonatomic) IBOutlet UILabel *Linelanel;
@property (weak, nonatomic) IBOutlet UILabel *DescripLabel;

@end
