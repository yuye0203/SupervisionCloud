//
//  KBMListHeaderView.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/3.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MoreBtnBlock)(void);

@interface KBMListHeaderView : UITableViewHeaderFooterView
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy  ) MoreBtnBlock moreBtnPress;


@end
