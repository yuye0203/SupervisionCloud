//
//  PersonCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userNameL;//用户名
@property (weak, nonatomic) IBOutlet UILabel *telNum;//电话
@property (weak, nonatomic) IBOutlet UILabel *positionL;//职务
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标
@property (weak, nonatomic) IBOutlet UILabel *statusL;//日期

@end
