//
//  KnowledgeDetailVModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KnowledgeDetailVModel.h"
#import "UserInfoManager.h"
#import "BaseModel.h"
#import "KnowledgeModel.h"

@implementation KnowledgeDetailVModel

- (void)getDetailInfo:(NSString *)idField CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    
//    cmd		string	指定值：knowledgeDetail
//    user_id			int	用户id
//    auth_token			string
//    id			int	问题id
//    verify			string	加密字符串
    
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];

    if ([UserInfoManager isLogin]) {
        UserInfoBody *model = [UserInfoManager getInfo];
        
        [newsParmaes addEntriesFromDictionary:@{
                                                @"cmd":@"knowledgeDetail",
                                                @"user_id":[NSNumber numberWithInteger: [model.idField integerValue]],
                                                @"auth_token":model.authToken,
                                                @"id":[NSNumber numberWithInteger: [idField integerValue]]}];
    }
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes] options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        
        BaseModel *root = [BaseModel mj_objectWithKeyValues:response];
        
        if(root.resultCode==1){
            KnowledgeModel *item = [KnowledgeModel mj_objectWithKeyValues:root.body];
            completionHandle(YES, nil, item);
           
            
//
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}


@end
