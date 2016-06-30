//
//  HomeTableViewCell.m
//  CQChatCricle
//
//  Created by chenq@kensence.com on 16/6/29.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

//- (void)layoutSubviews
//{
//    _HeadImage.layer.cornerRadius = 30;
//    _HeadImage.layer.masksToBounds = YES;
//    _HeadImage.backgroundColor = [UIColor cyanColor];
//}

- (void)drawRect:(CGRect)rect
{
    
    _HeadImage.layer.cornerRadius = 25;
        _HeadImage.layer.masksToBounds = YES;
        _HeadImage.backgroundColor = [UIColor cyanColor];
}




- (void)setModelWithHome:(HomeModel *)HomeModel
{
    
    
}



@end
