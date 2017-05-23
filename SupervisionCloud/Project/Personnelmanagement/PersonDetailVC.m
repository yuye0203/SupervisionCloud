//
//  PersonDetailVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonDetailVC.h"
#import "PersonDetailVM.h"
#import "PersonItem.h"
#import "UIImageView+WebCache.h"

@interface PersonDetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;//图标

@property (weak, nonatomic) IBOutlet UILabel *userNameL;//用户名
@property (weak, nonatomic) IBOutlet UILabel *celluserNameL;//用户名

@property (weak, nonatomic) IBOutlet UILabel *telNum;//电话
@property (weak, nonatomic) IBOutlet UILabel *celltelNum;//电话

@property (weak, nonatomic) IBOutlet UILabel *positionL;//岗位
@property (weak, nonatomic) IBOutlet UILabel *noL;//工号
@property (weak, nonatomic) IBOutlet UILabel *sexL;//性别
@property (weak, nonatomic) IBOutlet UILabel *groupL;//项目组
@property (weak, nonatomic) IBOutlet UILabel *intentionL;//职务
@property (weak, nonatomic) IBOutlet UILabel *statusL;//状态
@property (weak, nonatomic) IBOutlet UILabel *dateL;//日期
@property (weak, nonatomic) IBOutlet UILabel *dynamic;//动态

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (nonatomic, strong) PersonDetailVM *viewModel;


@end

@implementation PersonDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewModel];
    
   self.iconImageView.image = [UIImage imageNamed:@"img_default"];//图标
    
    self.userNameL.text = @"";//用户名
    self.celluserNameL.text = @"";//用户名
    
    self.telNum.text = @"";//电话
    self.celltelNum.text = @"";//电话
    
    self.positionL.text = @"";//岗位
    self.noL.text = @"";//工号
    self.sexL.text = @"";//性别
    self.groupL.text = @"";//项目组
    self.intentionL.text = @"";//职务
    self.statusL.text = @"";//状态
    self.dateL.text = @"";//日期
    self.dynamic.text = @"";//动态

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(PersonDetailVM *)viewModel{
    if (_viewModel==nil) {
        _viewModel = [[PersonDetailVM alloc] init];
    }
    return _viewModel;
}
-(void)setupViewModel{
    sWeakSelf
    [self.viewModel getMoreData:self.idField completionHandle:^(BOOL success, NSError *error,id result){
        
        if (success) {
            PersonItem *item = (PersonItem*)result;
            
            weakSelf.userNameL.text = item.nickName;//用户名
            weakSelf.telNum.text = item.mobile;//电话
            weakSelf.positionL.text = item.role;//职务
            weakSelf.statusL.text = item.status;//日期
            
            
            [weakSelf.iconImageView sd_setImageWithURL:[NSURL URLWithString:item.headPortrait] placeholderImage:[UIImage imageNamed:@"img_default"]];

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
