//
//  QuestionDetailHeadCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "QuestionDetailHeadCell.h"
#import "QuestionModel.h"
#import "UIImageView+WebCache.h"

@implementation QuestionDetailHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)smk_configure:(UITableViewCell *)cell model:(id)model indexPath:(NSIndexPath *)indexPath {
    if (model) {
        QuestionModel *itemModle = (QuestionModel *)model;
        self.titleLabel.text = itemModle.title ;
        self.subtitle.text = itemModle.subtitle;
        self.commentL.text = [NSString stringWithFormat:@"%ld",(long)itemModle.answerNum];

        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:itemModle.imgUrl] placeholderImage:[UIImage imageNamed:@"img_default"]];
        
    }
    
}

@end
