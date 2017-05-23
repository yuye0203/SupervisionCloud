//
//  PersonCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonCell.h"
#import "UIImageView+WebCache.h"
#import "PersonItem.h"

@implementation PersonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
   
    PersonItem *item = (PersonItem*)model;
    
    self.userNameL.text = item.nickName;//用户名
    self.telNum.text = item.mobile;//电话
    self.positionL.text = item.role;//职务
    self.statusL.text = item.status;//日期


    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.headPortrait] placeholderImage:[UIImage imageNamed:@"img_default"]];
    
    
}


@end
