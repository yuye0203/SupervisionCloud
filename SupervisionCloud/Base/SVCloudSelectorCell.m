//
//  SVCloudSelectorCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SVCloudSelectorCell.h"

@implementation SVCloudSelectorCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = (NSDictionary *)model;
    self.titleLabel.text = dic[@"name"] ;
    self.summaryLabel.placeholder = dic[@"placeholder"];
    self.summaryLabel.text = dic[@"result"];
    
}

@end
