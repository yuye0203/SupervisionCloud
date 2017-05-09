//
//  SecondViewController.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/3/29.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ToDoVC.h"
#import "SVCloudAPI.h"
#import "ToDoViewModel.h"

@interface ToDoVC ()
@property (nonatomic, strong) ToDoViewModel *sviewModel;

@end


@implementation ToDoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ToDoViewModel *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[ToDoViewModel alloc]init];
    }
    return _sviewModel;
}

- (void)setupTableView
{
    sWeakSelf
    
    [self.sviewModel handleWithTable:self.table head:^{
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":@1,
                                                @"num":@3,
                                                @"cmd":@"questionList"}];
        
        [self.sviewModel getToDoListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            weakSelf.hudView.hidden = YES;
                            if (success) {
                                
                                [weakSelf.viewModel setDataWithModelArray:^NSArray *{
                                    return (NSArray *)result;
                                } completion:^{
                                    [weakSelf.table reloadData];
                                }];
                            }
                        }] ;
        
        
    } foot:^{
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":@1,
                                                @"num":@3,
                                                @"cmd":@"questionList"}];
        
        [self.sviewModel getToDoListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            weakSelf.hudView.hidden = YES;
                            if (success) {
                                
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
