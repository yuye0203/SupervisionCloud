//
//  FindResourVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FindResourVC.h"
#import "FindResourVM.h"
#import "UserInfoManger.h"

@interface FindResourVC ()
@property (nonatomic, strong) FindResourVM *sviewModel;
@property (nonatomic, assign) NSInteger pageIndex;

@end

@implementation FindResourVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageIndex = 1;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FindResourVM *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[FindResourVM alloc]init];
    }
    return _sviewModel;
}

- (void)setupTableView
{
    sWeakSelf
    UserInfoBody *model = [UserInfoManger getInfo];

    [self.sviewModel handleWithTable:self.table head:^{
        
        _pageIndex = 1;
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:_pageIndex],
                                                @"num":@15,
                                                @"cmd":@"knowledgeList",
                                                @"user_id":model.idField,
                                                @"auth_token":@"dc7942492b55d8e30531a8a8cf2b550b"}];

        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            if (success) {
                                _pageIndex++;
                                [weakSelf.viewModel setDataWithModelArray:^NSArray *{
                                    return (NSArray *)result;
                                } completion:^{
                                    [weakSelf.table reloadData];
                                }];
                            }
                        }] ;
        
        
    } foot:^{
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:_pageIndex],
                                                @"num":@15,
                                                @"cmd":@"knowledgeList",
                                                @"user_id":model.idField,
                                                @"auth_token":@"dc7942492b55d8e30531a8a8cf2b550b"}];
        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            weakSelf.hudView.hidden = YES;
                            if (success) {
                                _pageIndex++;
                                
                                [weakSelf.viewModel setMoreDataWithModelArray:^NSArray *{
                                    
                                    return (NSArray *)result;
                                } completion:^{
                                    [weakSelf.table reloadData];
                                }];
                            }
                        }] ;
        
        
    }];
    
    

}

@end
