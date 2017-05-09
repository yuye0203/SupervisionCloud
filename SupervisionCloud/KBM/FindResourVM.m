//
//  FindResourVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FindResourVM.h"

#import "RootClass.h"
#import "MJExtension.h"
#import "KBMVResoureCell.h"


static NSString *const MyCellIdentifier = @"KBMVResoureCell" ;

@implementation FindResourVM

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    [super handleWithTable:table head:head foot:foot];

    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];

}
- (void)setDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    
    if (modelArrayBlock) {
        [self.dataArrayList removeAllObjects];
        NSArray *list = (NSArray *)modelArrayBlock();
        [self.dataArrayList addObjectsFromArray:list];
        self.table.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            self.getMoreData();
        }];
        
        if (completion) {
            completion();
        }
    }
}


- (void)getListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        [self.table.mj_header endRefreshing];
        [self.table.mj_footer endRefreshing];

        RootClass *root = [RootClass mj_objectWithKeyValues:response];
        if (root.resultCode ==1) {
            if (root.body.list.count==0) {
                completionHandle(NO, nil, nil);
            }else{
                completionHandle(YES, nil, root.body.list);
            }
        }else
            completionHandle(NO, nil, root.resultMessage);

    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}

- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
        [self.dataArrayList removeAllObjects];
        ListBody *body = (ListBody *)modelArrayBlock();
        
        [self.dataArrayList addObject:body.question];
        [self.dataArrayList addObject:body.hot];
        
        if (completion) {
            
            completion();
        }
    }
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArrayList.count;
}


@end
