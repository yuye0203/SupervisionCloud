//
//  SVCloudTextViewCell.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BRPlaceholderTextView.h"


@interface SVCloudTextViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *typeName;//
@property (strong, nonatomic) BRPlaceholderTextView *textView;//描述

@end
