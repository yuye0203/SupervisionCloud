//
//  ScreenVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ScreenVM.h"
#import "RootClass.h"
#import "MJExtension.h"

@implementation ScreenVM

- (void)loadTypeWithType:(NSInteger)type CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    NSDictionary *parmars;
    if (type==1) {
        parmars = @{@"cmd":@"questionType"};
    }else
        parmars = @{@"cmd":@"questionType"};
    NSData *data =    [NSJSONSerialization dataWithJSONObject:@{@"cmd":@"questionType"} options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        
        RootClass *root = [RootClass mj_objectWithKeyValues:response];
        
        if(root.resultCode==1){
            if (root.body.list.count==0) {
                completionHandle(NO, nil, nil);
            }else{
                completionHandle(YES, nil, root.body.list);
            }
            
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}

- (void)loadStautsCompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:@{@"cmd":@"questionType"} options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        
        RootClass *root = [RootClass mj_objectWithKeyValues:response];
        
        if(root.resultCode==1){
            if (root.body.list.count==0) {
                completionHandle(NO, nil, nil);
            }else{
                completionHandle(YES, nil, root.body.list);
            }
            
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}

@end
