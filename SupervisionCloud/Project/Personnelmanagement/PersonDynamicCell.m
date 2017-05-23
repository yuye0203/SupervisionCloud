//
//  PersonDynamicCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonDynamicCell.h"
#import "UIImageView+WebCache.h"

@implementation PersonDynamicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {

    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.iconImageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.iconImageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.iconImageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.iconImageView.layer.mask = maskLayer;

    //
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:@"111"] placeholderImage:[UIImage imageNamed:@"img_default"]];
    
    
}

@end
