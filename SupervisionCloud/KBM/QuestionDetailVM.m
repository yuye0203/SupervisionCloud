//
//  QuestionDetailVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "QuestionDetailVM.h"
#import "UserInfoManager.h"
#import "BaseModel.h"
#import "QuestionModel.h"
#import "QuestionDetailHeadCell.h"
#import "QuestionAskCell.h"
static NSString *const MyCellIdentifier1 = @"QuestionDetailHeadCell" ;
static NSString *const MyCellIdentifier2 = @"QuestionAskCell" ;

@interface QuestionDetailVM ()
@property (nonatomic, strong) QuestionModel *questionItem;


@end
@implementation QuestionDetailVM

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    self.table.mj_header = nil;
    self.table.mj_footer = nil;
    
    [super handleWithTable:table head:head foot:foot];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier1];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier2];

    
    
}
- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    

        
//    cmd		string	指定值：answerList	TRUE
//    user_id		int	用户id	TRUE
//    auth_token		string		TRUE
//    id		int	问题id	TRUE
//    page		int	当前页数	FALSE	默认第一页
//    num		int	数量	FALSE	默认15个
//    verify		string	加密字符串	TRUE	参考加密说明
    UserInfoBody *user = [UserInfoManager getInfo];
  
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:1],
                                            @"num":@15,
                                            @"cmd":@"answerList",
                                            @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                            @"auth_token":user.authToken,
                                            @"id":[NSNumber numberWithInteger:[self.idField integerValue]]}];
    
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
                      NSArray * array = [QuestionModel mj_objectArrayWithKeyValuesArray:arr];
                      
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
                                            @"cmd":@"userList",
                                            @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                            @"auth_token":user.authToken,
                                            @"id":[NSNumber numberWithInteger:[self.idField integerValue]]}];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  [self.table.mj_footer endRefreshing];
                  
                  
                  BaseModel *root = [BaseModel mj_objectWithKeyValues:response];
                  if (root.resultCode ==1) {
                      NSArray * array = [QuestionModel mj_objectArrayWithKeyValuesArray:root.body];
                      
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
}


- (void)getDetailInfo:(NSString *)idField CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    
    //    cmd		string	指定值：questionDetail
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
                                                @"cmd":@"questionDetail",
                                                @"user_id":[NSNumber numberWithInteger: [model.idField integerValue]],
                                                @"auth_token":model.authToken,
                                                @"id":[NSNumber numberWithInteger: [idField integerValue]]}];
    }
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:newsParmaes] options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        
        BaseModel *root = [BaseModel mj_objectWithKeyValues:response];
        
        if(root.resultCode==1){
            QuestionModel *item = [QuestionModel mj_objectWithKeyValues:root.body];
            self.questionItem = item;
            completionHandle(YES, nil, item);
            
            
            //
        }else
            completionHandle(NO, nil, @"11111");
        
        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];
}
- (void)zanAction:(NSString *)idField CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else
        
    return self.dataArrayList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier1 forIndexPath:indexPath] ;
        [cell smk_configure:cell model:self.questionItem indexPath:indexPath];
        
        return cell ;

    }
    id item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier2 forIndexPath:indexPath] ;
    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier1 cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
            [cell smk_configure:cell model:self.questionItem indexPath:indexPath];
        }];

    }
    id item = [self itemAtIndexPath:indexPath] ;
    
    return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier1 cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
