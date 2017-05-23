//
//  PersonDynamicVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonDynamicVM.h"
#import "BaseModel.h"
#import "MJExtension.h"
#import "PersonDynamicCell.h"
#import "PersonDynamicFirstCell.h"

#import "KnowledgeModel.h"
#import "UserInfoManager.h"

static NSString *const MyCellIdentifier = @"PersonDynamicFirstCell" ;
static NSString *const MyCellIdentifier1 = @"PersonDynamicCell" ;


@implementation PersonDynamicVM


- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    [super handleWithTable:table head:head foot:foot];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier1];

    
}
- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
        if (completion) {
            completion();
        }
    }
    
}

- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    UserInfoBody *user = [UserInfoManager getInfo];
    
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:1],
                                            @"num":@15,
                                            @"cmd":@"knowledgeList",
                                            @"user_id":user.idField,
                                            @"auth_token":user.authToken}];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  
                  NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                           options:NSJSONReadingMutableLeaves
                                                                             error:nil];
                  
                  BaseModel *root = [BaseModel creatWithDic:jsonDict];
                  
                  if (root.resultCode ==1) {
                      NSArray * array = [KnowledgeModel mj_objectArrayWithKeyValuesArray:root.body[@"list"]];
                      self.dataArrayList = [NSMutableArray arrayWithArray:array];
                      [self.table.mj_header endRefreshing];
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
}
- (void)getMoreData:(NSInteger)pageIndex completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    UserInfoBody *user = [UserInfoManager getInfo];
    
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:pageIndex],
                                            @"num":@15,
                                            @"cmd":@"knowledgeList",
                                            @"user_id":user.idField,
                                            @"auth_token":user.authToken}];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  
                  NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                           options:NSJSONReadingMutableLeaves
                                                                             error:nil];
                  
                  BaseModel *root = [BaseModel creatWithDic:jsonDict];
                  
                  if (root.resultCode ==1) {
                      NSArray * array = [KnowledgeModel mj_objectArrayWithKeyValuesArray:root.body];
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
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
    if (indexPath.row==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath] ;
        [cell smk_configure:cell model:item indexPath:indexPath];
        
        return cell ;

    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier1 forIndexPath:indexPath] ;
    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    if (indexPath.row==0) {
        return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
            [cell smk_configure:cell model:item indexPath:indexPath];
        }];

    }
    return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier1 cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end

