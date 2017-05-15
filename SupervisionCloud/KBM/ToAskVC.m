//
//  ToAskVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ToAskVC.h"
#import "ToAskViewModel.h"
#import "TPKeyboardAvoidingTableView.h"
#import "BaseVC.h"
#import "SVProgressHUD.h"

@interface ToAskVC ()
@property (nonatomic, weak) IBOutlet TPKeyboardAvoidingTableView *table;
@property (nonatomic, weak) IBOutlet UICollectionView *collection;

@property (nonatomic, strong) ToAskViewModel *viewModel;

@end

@implementation ToAskVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView] ;
    [self setupCollectionView];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (ToAskViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[ToAskViewModel alloc]init];
    }
    return _viewModel;
}

/**
 *  tableView的一些初始化工作
 */
- (void)setupTableView
{
    sWeakSelf
    self.viewModel.showActionSheetViewController = self;
    self.viewModel.addImageBlock = ^{
        [weakSelf.view endEditing:YES];
    };
    [self.viewModel handleWithTable:self.table];
    [SVProgressHUD showWithStatus:@"加载中..."];
    [self.viewModel getQuestionType:^(BOOL success, NSError *error,id result){
        if (success) {
            [SVProgressHUD dismiss];
        }
    }];
}
-(void)setupCollectionView{
    [self.viewModel handWithCollectionView:self.collection];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
