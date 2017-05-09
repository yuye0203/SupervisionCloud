//
//  FindeQuestionVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FindeQuestionVC.h"
#import "SVCloudAPI.h"
#import "FindQuestionVM.h"
#import "UserInfoBody.h"
#import "UserInfoManger.h"
#import "ScreenVC.h"


@interface FindeQuestionVC ()
@property (nonatomic, strong) FindQuestionVM *sviewModel;

@end


@implementation FindeQuestionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (FindQuestionVM *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[FindQuestionVM alloc]init];
    }
    return _sviewModel;
}

- (void)setupTableView
{
    sWeakSelf
    
    
//    cmd		string	指定值：questionList	TRUE
//    user_id		int	用户id	TRUE
//    auth_token		string		TRUE
//    order		int	1按照时间倒序排列 2正序	FALSE
//    key_word		string	关键词	FALSE
//    num		int	图片数量	FALSE	默认15个
//    page		int	当前页数	FALSE	默认第一页
//    verify		string	加密字符串	TRUE	参考加密说明
    [self.sviewModel handleWithTable:self.table head:^{
        UserInfoBody *model = [UserInfoManger getInfo];

        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        [newsParmaes addEntriesFromDictionary:@{@"page":@1,
                                                @"num":@15,
                                                @"cmd":@"questionList",
                                                @"user_id":model.idField,
                                                @"auth_token":@"dc7942492b55d8e30531a8a8cf2b550b"}];
        
        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                    CompletionHandle:^(BOOL success, NSError *error,id result){
                        if (success) {
                            
                            [weakSelf.sviewModel setDataWithModelArray:^NSArray *{
                                return (NSArray *)result;
                            } completion:^{
                                [weakSelf.table reloadData];
                            }];
                        }
                    }] ;

    } foot:^{
        NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
        UserInfoBody *model = [UserInfoManger getInfo];

        [newsParmaes addEntriesFromDictionary:@{@"page":[NSNumber numberWithUnsignedInteger:_pageNum],
                                                @"num":@15,
                                                @"cmd":@"questionList",
                                                @"user_id":model.idField,
                                                @"auth_token":@"dc7942492b55d8e30531a8a8cf2b550b"}];

        
        [self.sviewModel getListData: [self parametersWithDic:newsParmaes]
                    CompletionHandle:^(BOOL success, NSError *error,id result){
                        weakSelf.hudView.hidden = YES;
                        if (success) {
                            _pageNum++;
                            [weakSelf.sviewModel setMoreDataWithModelArray:^NSArray *{
                                return (NSArray *)result;
                            } completion:^{
                                [weakSelf.table reloadData];
                            }];
                        }
                    }] ;

    }];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[ScreenVC class]]) {
        ScreenVC *vc = (ScreenVC *)destination;
        vc.fromType = 1;
    }
    
}

@end
