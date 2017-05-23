//
//  PersonDynamicFirstCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonDynamicFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameL;//用户名
@property (weak, nonatomic) IBOutlet UILabel *detaildateL;//详细日期
@property (weak, nonatomic) IBOutlet UILabel *dateL;//日期
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标
@property (weak, nonatomic) IBOutlet UILabel *contentL;//内容

@end
