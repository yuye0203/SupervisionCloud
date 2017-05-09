//
//  BaseTableViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"
#import "MJRefresh.h"
#import "BaseCell.h"

static NSString *const MyCellIdentifier = @"BaseCell" ;
@interface BaseTableViewModel ()

@end

@implementation BaseTableViewModel

- (NSMutableArray *)dataArrayList {
    if (_dataArrayList == nil) {
        _dataArrayList = [[NSMutableArray alloc] init];
    }
    return _dataArrayList;
}

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
  
    table.delegate = self;
    table.dataSource = self;
    self.dataArrayList = [[NSMutableArray alloc] init];
  
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    
    if (head) {
        table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            head();
            }];
        [table.mj_header beginRefreshing];

    }
    table.mj_footer.hidden = YES;

    if (foot) {
        self.getMoreData = foot;
    }
    self.table = table;

}

- (void)setDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {

    if (modelArrayBlock) {
        [self.dataArrayList removeAllObjects];
        NSArray *list = [NSArray arrayWithArray:(NSArray *)modelArrayBlock()];
        [self.dataArrayList addObjectsFromArray:list];
        self.table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.getMoreData();
        }];

        if (completion) {
            completion();
        }
    }
}
- (void)setMoreDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
        [self.dataArrayList addObjectsFromArray:modelArrayBlock()];
        if (completion) {
            completion();
        }
    }
    
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrayList[indexPath.row];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath] ;
    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    
    return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
