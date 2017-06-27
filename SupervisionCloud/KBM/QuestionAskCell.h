//
//  QuestionAskCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionAskCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//用户名
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;//描述
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标
@property (weak, nonatomic) IBOutlet UILabel *dataLable;//日期


@end
