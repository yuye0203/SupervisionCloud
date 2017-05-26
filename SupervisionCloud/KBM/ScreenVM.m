//
//  ScreenVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ScreenVM.h"
#import "BaseModel.h"
#import "QuestionType.h"

#import "MJExtension.h"

@implementation ScreenVM

- (void)loadQuestionTypeWithType:(NSInteger)type CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    NSDictionary *parmars;
    if (type==1) {
        parmars = @{@"cmd":@"questionType"};
    }else
        parmars = @{@"cmd":@"knowledgeType"};
  
    NSData *data =    [NSJSONSerialization dataWithJSONObject:parmars
                                                      options:NSJSONWritingPrettyPrinted
                                                        error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
       
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                 options:NSJSONReadingMutableLeaves
                                                                   error:nil];

        
        BaseModel *root = [BaseModel creatWithDic:jsonDict];
        
        if(root.resultCode==1){
            NSArray * list = [QuestionType mj_objectArrayWithKeyValuesArray:root.body];
            completionHandle(YES, nil, list);

            
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}

- (void)loadKnowledgeTypeWithType:(NSInteger)type CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:@{@"cmd":@"knowledgeList"} options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                 options:NSJSONReadingMutableLeaves
                                                                   error:nil];
        
        
        BaseModel *root = [BaseModel creatWithDic:jsonDict];

        if(root.resultCode==1){
            NSArray * list = [QuestionType mj_objectArrayWithKeyValuesArray:root.body];
            completionHandle(NO, nil, list);
            
            
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}

@end
