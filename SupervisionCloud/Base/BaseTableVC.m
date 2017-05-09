//
//  BaseTableVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableVC.h"
#import "BaseTableViewModel.h"
#import "NSString+MD5HexDigest.h"

@interface BaseTableVC ()

@end

@implementation BaseTableVC



- (void)viewDidLoad
{
    [super viewDidLoad] ;
    [self setupTableView] ;
}

- (BaseTableViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[BaseTableViewModel alloc]init];
    }
    return _viewModel;
}

/**
 *  tableView的一些初始化工作
 */
- (void)setupTableView
{
    [self.viewModel handleWithTable:self.table head:nil foot:nil];
}


#pragma mark lazy
- (UIView *)hudView {
    if (_hudView == nil) {
        UIView *hudView = [[UIView alloc]init];
        hudView.frame = [UIApplication sharedApplication].keyWindow.bounds;
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(0, 0, 200, 30);
        CGPoint center = hudView.center;
        center.x = center.x + 50;
        label.center = center;
        label.font = [UIFont systemFontOfSize:20];
        label.textColor = [UIColor orangeColor];
        label.text = @"加载中。。。";
        hudView.hidden = YES;
        [hudView addSubview:label];
        [[UIApplication sharedApplication].keyWindow addSubview:(_hudView = hudView)];
    }
    return _hudView;
}


@end
