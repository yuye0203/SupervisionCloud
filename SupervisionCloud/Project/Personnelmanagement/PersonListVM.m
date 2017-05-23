//
//  PersonListVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonListVM.h"

#import "RootClass.h"
#import "MJExtension.h"
#import "PersonCell.h"
#import "KnowledgeModel.h"
#import "UserInfoManager.h"
#import "ManagerProject.h"

static NSString *const MyCellIdentifier = @"PersonCell" ;

@implementation PersonListVM


- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    [super handleWithTable:table head:head foot:foot];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    
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
    
    
//    cmd			string	指定值：userList	TRUE
//    user_id			int	用户id	TRUE
//    auth_token					TRUE
//    project_id			int	项目id	TRUE
//    status			int	状态	FALSE
//    role			int	角色id	FALSE
//    num			int	图片数量	FALSE
//    page			int	当前页数	FALSE
//    verify			string	加密字符串	TRUE
    
    UserInfoBody *user = [UserInfoManager getInfo];
    Project * project = [ManagerProject getProject];
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:1],
                                            @"num":@15,
                                            @"cmd":@"userList",
                                            @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                            @"auth_token":user.authToken,
                                            @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]]}];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  [self.table.mj_header endRefreshing];
                  
                  RootClass *root = [RootClass mj_objectWithKeyValues:response];
                  NSArray *arr = root.body.list;
                  if (root.resultCode ==1) {
                      NSArray * array = [PersonItem mj_objectArrayWithKeyValuesArray:arr];
                      
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
    Project * project = [ManagerProject getProject];
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:pageIndex],
                                            @"num":@15,
                                            @"cmd":@"userList",
                                            @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                            @"auth_token":user.authToken,
                                            @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]]}];

    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  [self.table.mj_footer endRefreshing];

                  
                  RootClass *root = [RootClass mj_objectWithKeyValues:response];
                  NSArray *arr = root.body.list;
                  if (root.resultCode ==1) {
                      NSArray * array = [PersonItem mj_objectArrayWithKeyValuesArray:arr];

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
    id item = [self itemAtIndexPath:indexPath] ;

    if (self.goToListDetail) {
        self.goToListDetail(item);
    }
}


@end
