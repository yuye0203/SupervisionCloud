//
//  SystemDocumentsListVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/25.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SystemDocumentsListVM.h"
#import "ManagerProject.h"
#import "UserInfoManager.h"

#import "BaseModel.h"
#import "DocumentsItem.h"

static NSString *const MyCellIdentifier = @"SystemDocumentsListCell" ;

@implementation SystemDocumentsListVM


- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    [super handleWithTable:table head:head foot:foot];
    
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
    
    
    
//    cmd			string	指定值：filesCountList
//    user_id			int	用户id
//    auth_token			string
//    project_id			int	项目id
//    verify			string	加密字符串
    Project * project = [ManagerProject getProject];
    UserInfoBody *user = [UserInfoManager getInfo];
    
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{
                                            @"cmd":@"filesCountList",
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
                  
                  BaseModel *root = [BaseModel mj_objectWithKeyValues:response];
                  NSArray *arr = root.body;
                  if (root.resultCode ==1) {
                      NSArray * array = [DocumentsItem mj_objectArrayWithKeyValuesArray:arr];
                      self.dataArrayList = [array mutableCopy];

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
    return 60;
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
