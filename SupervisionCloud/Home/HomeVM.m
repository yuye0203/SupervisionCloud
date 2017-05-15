//
//  HomeVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/10.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "HomeVM.h"
#import "UserInfoManager.h"
#import "RootClass.h"
#import "MJExtension.h"
#import "BaseModel.h"
#import "Project.h"
#import "ManagerProject.h"
#import "Banner.h"
#import "SVCloudAPI.h"
#import "FunctionItem.h"

@implementation HomeVM

//获取bannerInfo
- (void)getBannerInfo:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
//    cmd		string	指定值：banner	TRUE
//    project_id		int	项目id	TRUE
//    user_id		int	用户id	TRUE
//    auth_token		string		TRUE
    
    Project*project = [ManagerProject getProject];
   UserInfoBody *user = [UserInfoManager getInfo];
    NSMutableDictionary *paramaters = [@{@"cmd":@"banner",
                                         @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]],
                                         @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                         @"auth_token":AUTH_TOKEN} mutableCopy];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:paramaters]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                 options:NSJSONReadingMutableLeaves
                                                                   error:nil];

        BaseModel *root = [BaseModel creatWithDic:jsonDict];
        if (root.resultCode ==1) {
            Banner *banner = [Banner mj_objectWithKeyValues:root.body];
            completionHandle(YES, nil, banner);
            
        }else
            completionHandle(NO, nil, root.resultMessage);
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
    
    
}

//获取人员项目
- (void)getUserProject:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    UserInfoBody *user = [UserInfoManager getInfo];

    NSMutableDictionary *paramaters = [@{@"cmd":@"userProject",
                                         @"auth_token":AUTH_TOKEN,
                                         @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]]
                                         } mutableCopy];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:paramaters]
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
            NSArray * array = [Project mj_objectArrayWithKeyValuesArray:root.body];
            completionHandle(YES, nil, array);
            
        }else
            completionHandle(NO, nil, root.resultMessage);
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
    
    
}
//获取人员项目
- (void)getFunctionList:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    //    cmd
    //    user_id
    //    auth_token
    UserInfoBody *user = [UserInfoManager getInfo];
    Project*project = [ManagerProject getProject];

    NSMutableDictionary *paramaters = [@{@"cmd":@"functionList",
                                         @"auth_token":AUTH_TOKEN,
                                         @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                         @"project_id":[NSNumber numberWithInteger:[project.idField integerValue]]} mutableCopy];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:paramaters]
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
                      NSArray * array = [FunctionItem mj_objectArrayWithKeyValuesArray:root.body];

                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
}

@end
