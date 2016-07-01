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

- (void)drawRect:(CGRect)rect
{
        _HeadImage.layer.cornerRadius = 25;
        _HeadImage.layer.masksToBounds = YES;
        _HeadImage.backgroundColor = [UIColor cyanColor];
        _TimeLabel.textAlignment =NSTextAlignmentRight;

}





-(void)setModel:(HomeModel *)model
{
    self.NickName.text = model.Name;
    self.MessageLabel.text = model.DescripString;
    self.TimeLabel.text = model.Time;
    self.HeadImage.image = model.image;
    
}

- (void)setModelWithHome:(HomeModel *)HomeModel
{
    self.NickName.text = HomeModel.Name;
    self.MessageLabel.text = HomeModel.DescripString;
    self.TimeLabel.text = HomeModel.Time;
    
    
    
}



@end
