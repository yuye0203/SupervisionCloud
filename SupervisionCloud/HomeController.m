//
//  HomeController.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/3/29.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "HomeController.h"
#import "LoginVC.h"
#import "MangerHomeView.h"
#import "HomeVM.h"
#import "UserInfoManager.h"
#import "ManagerProject.h"
#import "PersonnelManagementVC.h"

@interface HomeController (){
    MangerHomeView *mhome;
}
@property(nonatomic,strong) HomeVM *homeVM;

@end

@implementation HomeController
-(HomeVM *)homeVM{
    if (_homeVM==nil) {
        _homeVM = [[HomeVM alloc] init];
    }
    return _homeVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO:判断身份
    //项目经理
    
    UserInfoBody *user = [UserInfoManager getInfo];
    
    if(user.type ==1){
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
        mhome = (MangerHomeView *)[nib objectAtIndex:0];
        self.view = mhome;
        [mhome creatDropMenu];
        mhome.goToDetail = ^(FunctionItem *item){
            [self goToDetail:item];
        };
        [self.homeVM getUserProject:^(BOOL success, NSError *error,id result){
            NSLog(@"getUserProject");
            if (success) {
                [mhome createAllMenuData:result];
                [ManagerProject saveProject:result[0]];
                [self getBannerInfo];
                [self getFunctionList];
                [mhome setupTableView];
            }
            
    
        }];
    }
    //管理层
    if(/* DISABLES CODE */ (NO)){
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
        mhome = (MangerHomeView *)[nib objectAtIndex:0];
        self.view = mhome;
    }
    //施工单位
    if (NO) {
        self.tabBarController.tabBar.hidden = YES;
    }
    //业主
    if(/* DISABLES CODE */ (NO)){
        self.tabBarController.tabBar.hidden = YES;

    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getBannerInfo{
    
    [self.homeVM getBannerInfo:^(BOOL success, NSError *error,id result){
        NSLog(@"getBannerInfo");
        if (success) {
            
            [mhome setBannerInfo:result];
        }
    }];

}
-(void)getFunctionList{
    
    [self.homeVM getFunctionList:^(BOOL success, NSError *error,id result){
        NSLog(@"getFunctionList");
        if (success) {
            
            [mhome setActivtiyViews:result];
        }
    }];
    
}

-(void)goToDetail:(FunctionItem *)item{
    
    //TODO:判断功能类型
    UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
    
    PersonnelManagementVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonnelManagementVC"];
    [self presentViewController:vc
                       animated:YES
                     completion:nil];

}

@end
