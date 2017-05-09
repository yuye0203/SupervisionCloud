//
//  LoginVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/8.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "LoginVM.h"
#import "UserInfoBody.h"
#import "MJExtension.h"
#import "UserRoot.h"
#import "UserInfoManger.h"

@implementation LoginVM
- (void)loginAction:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        UserRoot *root = [UserRoot mj_objectWithKeyValues:response];
        if (root.resultCode==1) {
            /*登录成功 保存信息*/
            //TODO:保存信息
            [UserInfoManger saveInfo:root.body];

            completionHandle(YES, nil, nil);

        }else
            completionHandle(NO, nil, root.resultMessage);

        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, @"登录失败");
    }];
    

}

@end
