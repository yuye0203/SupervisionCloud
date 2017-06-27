//
//  QuestionAskCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "QuestionAskCell.h"
#import "QuestionAskItem.h"
#import "UIImageView+WebCache.h"

@implementation QuestionAskCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)drawRect:(CGRect)rect{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.imageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.imageView.layer.mask = maskLayer;
    
    // Initialization code
    
}


- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    if (model) {
        QuestionAskItem *itemModle = (QuestionAskItem*)model;
        self.titleLabel.text = itemModle.createdBy ;
        self.summaryLabel.text = itemModle.answer;
        self.dataLable.text = itemModle.time;
        
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:itemModle.image] placeholderImage:[UIImage imageNamed:@"img_default"]];

    }
    
}

@end
