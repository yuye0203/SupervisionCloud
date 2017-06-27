//
//  QuestionDetailHeadCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionDetailHeadCell : UITableViewCell

typedef void(^ZanAction)();

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *commentL;//
@property (weak, nonatomic) IBOutlet UILabel *zanL;//

@property (weak, nonatomic) IBOutlet UIButton *zanBtn;//
@property (nonatomic, copy) ZanAction  zanAction;


@end
