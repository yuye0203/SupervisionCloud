//
//  SecurityListVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/31.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SecurityListVM.h"
#import "UserInfoManager.h"
#import "ManagerProject.h"
#import "BaseModel.h"

@implementation SecurityListVM
- (void)getSecurityData:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
//    cmd			string	指定值：safeIndex	TRUE
//    user_id			int	用户id	TRUE	78
//    auth_token			string		TRUE
//    project_id			int	项目id	TRUE
//    verify			string	加密字符串	TRUE	参考加密说明
//    
    UserInfoBody *user = [UserInfoManager getInfo];
    Project * project = [ManagerProject getProject];
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{
                                            @"cmd":@"safeIndex",
                                            @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                            @"auth_token":user.authToken,
                                            @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]]}];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  
                  BaseModel *root = [BaseModel mj_objectWithKeyValues:response];
//                  NSArray *arr = root.body.list;
                  if (root.resultCode ==1) {
//                      NSArray * array = [PersonItem mj_objectArrayWithKeyValuesArray:arr];
                      
//                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
}


@end
