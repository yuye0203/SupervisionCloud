//
//  LoginVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "LoginVC.h"
#import "SVProgressHUD.h"
#import "LoginVM.h"
@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *nameL;//用户名
@property (weak, nonatomic) IBOutlet UITextField *pswL;//描述

@property (nonatomic, strong) LoginVM *viewModel;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LoginVM *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[LoginVM alloc]init];
    }
    return _viewModel;
}

-(IBAction)loginAction:(id)sender{
    
    if (self.nameL.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if (self.pswL.text.length <5) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的密码"];
        return;
    }

    
//    cmd		string	指定值：login	TRUE
//    login_name			string	登陆名	TRUE
//    password			string	密码	TRUE
//    verify			string	加密字符串	TRUE
    [SVProgressHUD showWithStatus:@"登录中,请稍后"];
    NSMutableDictionary *newsParmaes = [[NSMutableDictionary alloc] init];
    [newsParmaes addEntriesFromDictionary:@{@"login_name":@"xiangmujingli",
                                            @"password":@"111111",
                                            @"cmd":@"login"}];
    
    [self.viewModel loginAction:[self parametersWithDic:newsParmaes]
                  CompletionHandle:^(BOOL success, NSError *error,id result){
                      [SVProgressHUD dismiss];
                      if (success) {
                          [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                          [self dismissViewControllerAnimated:YES completion:nil];
                          
                      }else{
                          [SVProgressHUD showSuccessWithStatus:(NSString *)result];

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
