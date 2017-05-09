//
//  BaseTableViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMVVMKit.h"
#import "BaseViewModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MJRefresh.h"
typedef void(^GetMoreData)();


@interface BaseTableViewModel : BaseViewModel<UITableViewDelegate, UITableViewDataSource>

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (void)setDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion;
- (void)setMoreDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion;


@property (nonatomic, weak)  UITableView *table;
@property (nonatomic, strong) NSMutableArray *dataArrayList;
@property (nonatomic, copy) GetMoreData  getMoreData;

@end
