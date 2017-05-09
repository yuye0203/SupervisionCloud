//
//  KBMVCViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KBMVCViewModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "KBMVCell.h"
#import "SVCloudNetwork.h"
#import "MJExtension.h"
#import "SVCloudAPI.h"
#import "SVCloudData.h"
#import "RootClass.h"
#import "Masonry.h"
#import "KBMListHeaderView.h"
#import "QuestionModel.h"
#import "KBMVResoureCell.h"

static NSString *const MyCellIdentifier1 = @"KBMVCell" ;
static NSString *const MyCellIdentifier2 = @"KBMVResoureCell" ;
static NSString *const MyHeadIdentifier = @"headerView" ;

@interface KBMVCViewModel ()

@end

@implementation KBMVCViewModel

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    [super handleWithTable:table head:head foot:foot];
  
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier1];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier2];

    [table registerClass:[KBMListHeaderView class] forHeaderFooterViewReuseIdentifier:MyHeadIdentifier];
    
    
}

- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
    if (modelArrayBlock) {
        [self.dataArrayList removeAllObjects];
        ListBody *body = (ListBody *)modelArrayBlock();
        
        [self.dataArrayList addObject:body.question];
        [self.dataArrayList addObject:body.hot];

        if (completion) {
            
            completion();
        }
    }
}
- (void)getListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle{

    NSDate *datenow = [NSDate date];

    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:paramaters options:NSJSONWritingPrettyPrinted error:nil];

    [self postWithUrl:timeSp body:data showLoading:NO success:^(NSDictionary *response) {
        [self.table.mj_header endRefreshing];
      
        RootClass *root = [RootClass mj_objectWithKeyValues:response];
        
        if(root.resultCode==1){
            completionHandle(YES, nil, root.body);
        }else
            completionHandle(NO, nil, @"11111");

        
    } failure:^(NSError *error) {
        
        completionHandle(NO, error, nil);
    }];


}

- (void)postWithUrl:(NSString *)url body:(NSData *)body showLoading:(BOOL)show success:(void(^)(NSDictionary *response))success failure:(void(^)(NSError *error))failure
{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", HOST_URL, url];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];
    request.timeoutInterval= 5;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置body
    [request setHTTPBody:body];
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
       
        if (!error) {
            success(responseObject);
            
        } else {
            failure(error);
        }
    }] resume];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArrayList[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArrayList.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray *item = self.dataArrayList[section];
    
    return item.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath];
    if (indexPath.section==0) {
        KBMVCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier1 forIndexPath:indexPath] ;
        [cell smk_configure:cell model:item indexPath:indexPath];
        
        return cell ;

    }else{
        KBMVResoureCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier2 forIndexPath:indexPath] ;
        [cell smk_configure:cell model:item indexPath:indexPath];
        
        return cell ;

    }
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    CGFloat h =44.f;
    switch (indexPath.section) {
        case 0:{
             h = [tableView fd_heightForCellWithIdentifier:MyCellIdentifier1
                                          cacheByIndexPath:indexPath configuration:^(KBMVCell *cell) {
                [cell smk_configure:cell model:item indexPath:indexPath];    }];
        }
            break;
        default:
            h = [tableView fd_heightForCellWithIdentifier:MyCellIdentifier2
                                         cacheByIndexPath:indexPath configuration:^(KBMVResoureCell *cell) {
                [cell smk_configure:cell model:item indexPath:indexPath];    }];

            break;
    }
    
    return h;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    KnowledgeModel *itemModle;
    id model = self.dataArrayList[indexPath.section][indexPath.row];

    if (indexPath.section==1) {
        if ([model isKindOfClass:[QuestionModel class]])
            itemModle = (QuestionModel *)model;
        else
            itemModle = [QuestionModel mj_objectWithKeyValues:model];
    }else{
        if ([model isKindOfClass:[KnowledgeModel class]])
            itemModle = (KnowledgeModel *)model;
        else
            itemModle = [KnowledgeModel mj_objectWithKeyValues:model];

    }
    if (self.goToDetail) {
        self.goToDetail(itemModle);
    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 16;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    KBMListHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    
    if (section == 0) {
        headerView.title =  @"最新提问";
    } else {
        headerView.title = @"热搜资料";
    }
    headerView.moreBtnPress = ^{
        if ( self.goToMore) {
            self.goToMore(section);

        }
    };
    return headerView;
}
@end

