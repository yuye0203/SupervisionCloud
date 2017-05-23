//
//  PersonDetailVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonDetailVM.h"
#import "UserInfoManager.h"
#import "BaseModel.h"
#import "ManagerProject.h"
#import "PersonItem.h"

@implementation PersonDetailVM
- (void)getMoreData:(NSString *)idField completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    UserInfoBody *user = [UserInfoManager getInfo];
    Project *project = [ManagerProject getProject];
//    cmd			string	指定值：userInfo	TRUE
//    user_id			int	登陆用户id	TRUE
//    auth_token					TRUE
//    id			int	用户id	TRUE
//    verify			string	加密字符串	TRUE
    
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{
                                            @"cmd":@"userInfo",
                                            @"user_id":user.idField,
                                            @"auth_token":user.authToken,
                                            @"id":[NSNumber numberWithInteger:[idField integerValue]],
                                            @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]]}];
    
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
                      PersonItem *item = [PersonItem mj_objectWithKeyValues:root.body];
                      
//                      NSArray * array = [KnowledgeModel mj_objectArrayWithKeyValuesArray:root.body[@"list"]];
//                      self.dataArrayList = [NSMutableArray arrayWithArray:array];
//                      [self.table.mj_header endRefreshing];
                      completionHandle(YES, nil, item);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];

}
@end
