//
//  KnowledgeDetailVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "KnowledgeDetailVC.h"
#import "KnowledgeDetailVModel.h"
#import "KnowledgeModel.h"

@interface KnowledgeDetailVC ()
@property (nonatomic, strong) KnowledgeDetailVModel *viewModel;
@property(nonatomic,weak)IBOutlet UILabel  *titleL;
@property(nonatomic,weak)IBOutlet UILabel  *nameL;
@property(nonatomic,weak)IBOutlet UILabel  *numberL;
@property(nonatomic,weak)IBOutlet UILabel  *timeL;
@property(nonatomic,weak)IBOutlet UIImageView  *iconImage;

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
    sWeakSelf
    
    [self.viewModel getDetailInfo: self.idField
                CompletionHandle:^(BOOL success, NSError *error,id result){
                    if (success) {
                        KnowledgeModel *item = (KnowledgeModel *)result;
                        weakSelf.titleL.text = item.title;
                        weakSelf.nameL.text = item.author;
                        weakSelf.numberL.text = item.answerNum;
                        weakSelf.titleL.text = item.title;
                        weakSelf.titleL.text = item.title;

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
