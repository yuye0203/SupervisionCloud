//
//  SVCloudTextFieldCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SVCloudTextFieldCell.h"

@implementation SVCloudTextFieldCell

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
    self.typeName.text = dic[@"name"] ;
    self.textField.placeholder = dic[@"placeholder"];
    self.textField.text = dic[@"result"];

}


@end
