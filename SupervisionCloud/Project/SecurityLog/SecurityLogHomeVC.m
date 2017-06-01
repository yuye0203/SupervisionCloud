//
//  SecurityLogHomeVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/24.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SecurityLogHomeVC.h"
#import "SecurityListVM.h"
#import "PersonItem.h"

@interface SecurityLogHomeVC ()
@property (nonatomic, strong) SecurityListVM *viewModel;



@property (weak, nonatomic) IBOutlet UILabel *nameL1;//用户名
@property (weak, nonatomic) IBOutlet UILabel *nameL2;//用户名
@property (weak, nonatomic) IBOutlet UILabel *nameL3;//用户名
@property (weak, nonatomic) IBOutlet UILabel *nameL4;//用户名

@property (weak, nonatomic) IBOutlet UILabel *num1;
@property (weak, nonatomic) IBOutlet UILabel *num2;//电话
@property (weak, nonatomic) IBOutlet UILabel *num3;//电话
@property (weak, nonatomic) IBOutlet UILabel *num4;//电话



@end

@implementation SecurityLogHomeVC


-(SecurityListVM *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[SecurityListVM alloc] init];
    }
    return _viewModel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupViewModel{
    sWeakSelf
    [self.viewModel getSecurityData:^(BOOL success, NSError *error,id result){
        
        if (success) {
            PersonItem *item = (PersonItem*)result;
            
            weakSelf.nameL1.text = item.nickname;//用户名
            weakSelf.nameL2.text = item.mobile;//电话
            weakSelf.nameL3.text = item.role;//职务
            weakSelf.nameL4.text = item.status;//日期
            
            weakSelf.num1.text = item.nickname;//用户名
            weakSelf.num2.text = item.mobile;//电话
            weakSelf.num3.text = item.role;//职务
            weakSelf.num4.text = item.status;//日期

            
            
        }
        
    }];
    
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
