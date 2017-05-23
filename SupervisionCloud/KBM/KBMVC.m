//
//  KBMVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/3/30.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KBMVC.h"
#import "KBMVCViewModel.h"
#import "SVCloudAPI.h"
#import "SUIMVVMKit.h"
#import "NSString+MD5HexDigest.h"
#import "RootClass.h"
#import "MangerHomeView.h"
#import "ToAskVC.h"
#import "UserInfoManager.h"
#import "UserInfoBody.h"
#import "FindeQuestionVC.h"
#import "FindResourVC.h"
#import "QuestionModel.h"
#import "KnowledgeDetailVC.h"
@interface KBMVC ()
@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, strong) KBMVCViewModel *viewModel;


@end

@implementation KBMVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //管理层
//    if(/* DISABLES CODE */ (YES)){
//        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
//        MangerHomeView *mhome = (MangerHomeView *)[nib objectAtIndex:0];
//        self.view = mhome;
//    }else{
        [self setupTableView] ;
//    }


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (KBMVCViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[KBMVCViewModel alloc]init];
    }
    return _viewModel;
}

/**
 *  tableView的一些初始化工作
 */
- (void)setupTableView
{
    sWeakSelf

    [self.viewModel handleWithTable:self.table head:^{
        if ([UserInfoManager isLogin]) {
            UserInfoBody *model = [UserInfoManager getInfo];
            
            NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
            [newsParmaes addEntriesFromDictionary:@{
                                                    @"cmd":@"knowledgeIndex",
                                                    @"user_id":[NSNumber numberWithInteger: [model.idField integerValue]],
                                                    @"auth_token":model.authToken}];
            
            [weakSelf.viewModel getListData: [self parametersWithDic:newsParmaes]
                                 CompletionHandle:^(BOOL success, NSError *error,id result){

                                     if (success) {
                                         
                                         [weakSelf.viewModel getDataWithModelArray:^NSArray *{
                                             return (NSArray *)result;
                                         } completion:^{
                                             [weakSelf.table reloadData];
                                         }];
                                     }
                                 }] ;
            
            
        }else
            return;
    } foot:nil];
    self.viewModel.goToMore = ^(NSInteger section){
            [weakSelf gotoMoreList:section];
    };
    self.viewModel.goToDetail = ^(NSObject *item){
        [weakSelf gotoDetail:item];
    };

  
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"segue");
    
    QuestionModel *model = (QuestionModel *)sender;
    
    UIViewController* vc = segue.destinationViewController;
    
    if ([vc isKindOfClass:[KnowledgeDetailVC class]]) {
        KnowledgeDetailVC *detailVC = (KnowledgeDetailVC *)vc;
        
        [detailVC setIdField:model.idField];
    }



    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)gotoMoreList:(NSInteger)section{
    //DONE:GOTOMORE 0:NEWS 1:HOT
  
    if(section==0){
        [self gotoQuestion:nil];
    }else{
        [self gotoData:nil];

    }
}

-(void)gotoDetail:(NSObject *)item{
    //TODO 判断类型？
    QuestionModel *obj = (QuestionModel *)item;
    
    NSLog(@"item = %@",obj.idField);
//    
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"KBM" bundle:nil];
    
    KnowledgeDetailVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"KnowledgeDetailVC"];
    vc.idField = obj.idField;
    [self presentViewController:vc animated:YES completion:nil];


}

//TODO:查阅资料
-(IBAction)gotoData:(id)sender{
    
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"KBM" bundle:nil];
    FindResourVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"FindResourVC"];
    [self presentViewController:vc animated:YES completion:nil];

}
//TODO:查找问题
-(IBAction)gotoQuestion:(id)sender{
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"KBM" bundle:nil];
    
    FindeQuestionVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"FindeQuestionVC"];
    
    [self presentViewController:vc animated:YES completion:nil];

}
//TODO:我要提问
-(IBAction)gotoAsk:(id)sender{
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"KBM" bundle:nil];
    
    ToAskVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"ToAskVC"];
    
    [self presentViewController:vc animated:YES completion:nil];

}

@end



