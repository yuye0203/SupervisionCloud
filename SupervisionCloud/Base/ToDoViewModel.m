//
//  ToDoViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ToDoViewModel.h"
#import "RootClass.h"
#import "MJExtension.h"
#import "TodoListCell.h"

@implementation ToDoViewModel


- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    NSLog(@"%@",MyCellIdentifier);
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
}

- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
//        [self.dataArrayList removeAllObjects];
//        [self.dataArrayList addObjectsFromArray:modelArrayBlock()];
        if (completion) {
            completion();
        }
    }
    
}

- (void)getToDoListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        RootClass *root = [RootClass mj_objectWithKeyValues:response];
//        [self.dataArrayList addObjectsFromArray:root.body.list];

        completionHandle(YES, nil, root.body);
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
    
    
}


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

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
@end
