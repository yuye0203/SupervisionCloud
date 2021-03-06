//
//  KBMVResoureCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KBMVResoureCell.h"
#import "KnowledgeModel.h"
#import "MJExtension.h"

@interface KBMVResoureCell ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//用户名
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标
@property (weak, nonatomic) IBOutlet UILabel *dataLable;//日期

@end

@implementation KBMVResoureCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}


- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
   
    KnowledgeModel *itemModle;
    if ([model isKindOfClass:[KnowledgeModel class]])
        itemModle = (KnowledgeModel *)model;
    else
        itemModle = [KnowledgeModel mj_objectWithKeyValues:model];
    
    self.titleLabel.text = itemModle.title ;
    self.dataLable.text = itemModle.createTime;
    
    self.iconImageView.image = [UIImage imageNamed:@"img_default"] ;
}
@end
