//
//  KnowledgeDetailVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KnowledgeDetailVC.h"
#import "KnowledgeDetailVModel.h"
@interface KnowledgeDetailVC ()
@property (nonatomic, strong) KnowledgeDetailVModel *viewModel;

@end

@implementation KnowledgeDetailVC
-(KnowledgeDetailVModel *)viewModel{
    if (_viewModel==nil) {
        _viewModel = [[KnowledgeDetailVModel alloc] init];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getDetailInfo];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getDetailInfo{
    
    
    [self.viewModel getDetailInfo: self.idField
                CompletionHandle:^(BOOL success, NSError *error,id result){
                    if (success) {
                    }
                }] ;

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
