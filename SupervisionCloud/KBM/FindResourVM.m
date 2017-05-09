//
//  FindResourVM.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FindResourVM.h"

#import "RootClass.h"
#import "MJExtension.h"
#import "KBMVResoureCell.h"


static NSString *const MyCellIdentifier = @"KBMVResoureCell" ;


@interface FindResourVM ()

@end

@implementation FindResourVM

- (void)handleWithTable:(UITableView *)table head:(void (^)())head foot:(void (^)())foot {
    [super handleWithTable:table head:head foot:foot];
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    
    
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath] ;
    [cell smk_configure:cell model:item indexPath:indexPath];
    
    return cell ;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = [self itemAtIndexPath:indexPath] ;
    
    return [tableView fd_heightForCellWithIdentifier:MyCellIdentifier cacheByIndexPath:indexPath configuration:^(UITableViewCell *cell) {
        [cell smk_configure:cell model:item indexPath:indexPath];
    }];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
