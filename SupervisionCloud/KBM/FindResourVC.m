//
//  FindResourVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FindResourVC.h"
#import "FindResourVM.h"
#import "UserInfoManager.h"
#import "ScreenVC.h"
#import "SVCloudAPI.h"
#import "KnowledgeModel.h"
#import "KnowledgeDetailVC.h"

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

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_needReset) {
        [self setupTableView];
        _needReset = NO;
    }
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
    UserInfoBody *model = [UserInfoManager getInfo];

    [self.sviewModel handleWithTable:self.table head:^{
        
        _pageIndex = 1;
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithInteger:_pageIndex],
                                                @"num":@15,
                                                @"cmd":@"knowledgeList",
                                                @"user_id":model.idField,
                                                @"auth_token":model.authToken}];
        
        if (self.params) {
            [newsParmaes addEntriesFromDictionary:self.params];
        }
        


        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            if (success) {
                                _pageIndex++;
                                [weakSelf.sviewModel setDataWithModelArray:^NSArray *{
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
                                                @"auth_token":model.authToken}];
        
        if (self.params) {
            [newsParmaes addEntriesFromDictionary:self.params];
        }
        

        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                        CompletionHandle:^(BOOL success, NSError *error,id result){
                            weakSelf.hudView.hidden = YES;
                            if (success) {
                                _pageIndex++;
                                
                                [weakSelf.sviewModel setMoreDataWithModelArray:^NSArray *{
                                    
                                    return (NSArray *)result;
                                } completion:^{
                                    [weakSelf.table reloadData];
                                }];
                            }
                        }] ;
    }];
    
    
    self.sviewModel.goToListDetail = ^(NSObject *item){
        [weakSelf gotoDetail:item];
    };
    


}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[ScreenVC class]]) {
        ScreenVC *vc = (ScreenVC *)destination;
        vc.fromType = 1;
    }
    
}

-(void)gotoDetail:(id)item{
    KnowledgeModel *obj = (KnowledgeModel *)item;
    
    NSLog(@"item = %@",obj.idField);
    //
    
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"KBM" bundle:nil];
    
    KnowledgeDetailVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"KnowledgeDetailVC"];
    vc.idField = obj.idField;
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

@end
