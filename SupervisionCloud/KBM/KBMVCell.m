//
//  KBMVCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KBMVCell.h"
#import "KnowledgeModel.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"

@interface KBMVCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//用户名
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;//描述
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;//数量
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标
@property (weak, nonatomic) IBOutlet UILabel *dataLable;//日期

@end

@implementation KBMVCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
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
    KnowledgeModel *itemModle;
    if ([model isKindOfClass:[KnowledgeModel class]])
        itemModle = (KnowledgeModel *)model;
    else
        itemModle = [KnowledgeModel mj_objectWithKeyValues:model];
    
    self.titleLabel.text = itemModle.author ;
    self.summaryLabel.text = itemModle.title;
    self.numberLabel.text = [NSString stringWithFormat:@"%ld",(long)itemModle.answerNum];
    self.dataLable.text = itemModle.createTime;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:itemModle.imgUrl] placeholderImage:[UIImage imageNamed:@"img_default"]];

    
}
@end
