//
//  MangerHomeVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/11.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MangerHomeVM.h"
#import "BaseModel.h"
#import "MJExtension.h"
#import "RemoveCell.h"
#import "KBMVCell.h"
#import "UserInfoManager.h"
#import "SVCloudAPI.h"
#import "ManagerProject.h"
#import "StaffItem.h"
#import "QuestionModel.h"

static NSString *const MyCellIdentifier1 = @"KBMVCell" ;
static NSString *const MyCellIdentifier = @"RemoveCell" ;

@interface MangerHomeVM()
@property (nonatomic, strong) NSMutableArray *removeList;
@property (nonatomic, strong) NSMutableArray *questionList;


@end
@implementation MangerHomeVM
- (NSMutableArray *)removeList {
    if (_removeList == nil) {
        _removeList = [[NSMutableArray alloc] init];
    }
    return _removeList;
}
- (NSMutableArray *)questionList {
    if (_questionList == nil) {
        _questionList = [[NSMutableArray alloc] init];
    }
    return _questionList;
}

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    
    [super handleWithTable:table head:head foot:foot];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier1];

    
}
- (void)getRemoveList:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    //
    UserInfoBody *user = [UserInfoManager getInfo];
    Project *project = [ManagerProject getProject];
    
    
    NSMutableDictionary *paramaters = [@{@"cmd":@"removeList",
                                         @"auth_token":user.authToken,
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
                      NSArray * array = [QuestionModel mj_objectArrayWithKeyValuesArray:root.body];
                      self.removeList = [array mutableCopy];
                      
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
}
- (void)getQuestionList:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
//    cmd		string	指定值：questionList	TRUE
//    user_id		int	用户id	TRUE
//    auth_token		string		TRUE
//    order		int	1按照时间倒序排列 2正序	FALSE
//    key_word		string	关键词	FALSE
//    num		int	图片数量	FALSE	默认15个
//    page		int	当前页数	FALSE	默认第一页
//    verify		string	加密字符串	TRUE	参考加密说明
   
    UserInfoBody *user = [UserInfoManager getInfo];
    NSMutableDictionary *paramaters = [@{@"cmd":@"questionList",
                                         @"auth_token":user.authToken,
                                         @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]]} mutableCopy];
    
    
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
                      NSArray * array = [QuestionModel mj_objectArrayWithKeyValuesArray:root.body[@"list"]];
                      self.questionList = [array mutableCopy];
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];

}


- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.dataArrayList[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDataSource
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"可撤岗人员";
            break;
            
        default:
            return @"问答社区";
            break;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:{
            NSInteger rows = self.removeList.count;
            if (rows ==0) {
                return 0;
            }else
                return ++rows;
        }
            break;
            
        default:
            return self.questionList.count;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item ;
    NSString *cellIdentifier = @"";
    switch (indexPath.section) {
        case 0:{
            if(indexPath.row>0)
                item = self.removeList[indexPath.row-1];

            cellIdentifier = MyCellIdentifier;
        }
            break;
            
        default:{
            item = self.questionList[indexPath.row];

            cellIdentifier = MyCellIdentifier1;
        }
            break;
    }

   UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath] ;

    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item ;
    NSString *cellIdentifier = @"";
    switch (indexPath.section) {
        case 0:{
            if(indexPath.row>0)
                item = self.removeList[indexPath.row-1];
            
            cellIdentifier = MyCellIdentifier;
        }
            break;
            
        default:{
            item = self.questionList[indexPath.row];
            
            cellIdentifier = MyCellIdentifier1;
        }
            break;
    }
    return [tableView fd_heightForCellWithIdentifier:cellIdentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
