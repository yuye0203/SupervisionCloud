//
//  SVCloudTextViewCell.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SVCloudTextViewCell.h"
#import "Masonry.h"

@implementation SVCloudTextViewCell
-(BRPlaceholderTextView *)textView{
    if (_textView==nil) {
        _textView = [[BRPlaceholderTextView alloc]init];
        //文字样式
        [_textView setFont:[UIFont systemFontOfSize:14.f]];
        _textView.placeholder = @"请输入问题描述";
    }
    return _textView;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.contentView addSubview:self.textView];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.typeName);
        make.left.equalTo(self.typeName.mas_right).with.offset(8);
        make.right.equalTo(self.contentView).with.offset(-8);

        make.bottom.equalTo(self.contentView).with.offset(-8);
    }];
}
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
    self.textView.text = dic[@"result"];
    
}

@end
