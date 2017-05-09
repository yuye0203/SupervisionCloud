//
//  BaseTableVC.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewModel.h"
#import "BaseVC.h"


@interface BaseTableVC : BaseVC
@property (nonatomic, weak) IBOutlet UITableView *table;

@property (nonatomic, strong) BaseTableViewModel *viewModel;
/**
 *  hudView
 */
@property (nonatomic, weak) UIView *hudView;

- (void)setupTableView;
@end
