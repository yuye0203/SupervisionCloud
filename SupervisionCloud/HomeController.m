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
#import "SecurityLogHomeVC.h"
#import "ScheduleHomeListVC.h"
#import "MeasurementListVC.h"
#import "ProcessInspectionListVC.h"
#import "SystemDocumentsListVC.h"

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
    sWeakSelf
    UserInfoBody *user = [UserInfoManager getInfo];
    
    if(user.type ==1){
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
        mhome = (MangerHomeView *)[nib objectAtIndex:0];
        self.view = mhome;
        [mhome creatDropMenu];
        mhome.goToDetail = ^(FunctionItem *item){
            [weakSelf goToDetail:item];
        };
        self.homeVM.goToLogin =^ {
            [weakSelf gotoLoginC];
        };
        [self.homeVM getUserProject:^(BOOL success, NSError *error,id result){
            NSLog(@"getUserProject");
            if (success) {
                [mhome createAllMenuData:result];
                [ManagerProject saveProject:result[0]];
                [weakSelf getBannerInfo];
                [weakSelf getFunctionList];
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
    if (/* DISABLES CODE */ (NO)) {
        self.tabBarController.tabBar.hidden = YES;
    }
    //业主
    if(/* DISABLES CODE */ (NO)){
        self.tabBarController.tabBar.hidden = YES;

    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
//
    switch (item.idField) {
        case 1:{
            // 人员管理
             UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
             
             PersonnelManagementVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonnelManagementVC"];
             [self presentViewController:vc
             animated:YES
             completion:nil];
            
        }
            break;
        case 2:{
            /*进度管理  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"ScheduleManagement" bundle:nil];
            
            ScheduleHomeListVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"ScheduleHomeListVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];

        }
        case 3:{
            /*计量管理  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"MeasurementManagement" bundle:nil];
            
            MeasurementListVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"MeasurementListVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;
        case 4:{
            /*安全日志  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
            
            
        }
            break;
        case 5:{
            /*工序报验 */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"ProcessInspection" bundle:nil];
            
            ProcessInspectionListVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"ProcessInspectionListVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
            
            
        }
            break;
        case 6:{
            // 人员管理
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
            
            PersonnelManagementVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonnelManagementVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;
        case 7:{
            /*进度管理  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
        case 8:{
            /*进度管理  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;
        case 9:{
            /*安全日志  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
            
            
        }
            break;
        case 10:{
            /*安全日志  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
            
            
        }
            break;
        case 11:{
            // 人员管理
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
            
            PersonnelManagementVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonnelManagementVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;
        case 12:{
            /*进度管理  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
        case 13:{
            /*体系文件  */
            
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SystemDocuments" bundle:nil];
            
            SystemDocumentsListVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SystemDocumentsListVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;
        case 14:{
            /*安全日志  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
            
            
        }
            break;
        case 15:{
            /*安全日志  */
            
            UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
            
            SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
            [self presentViewController:vc
                               animated:YES
                             completion:nil];
            
        }
            break;

        default:
            break;
    }
    
    UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"SecurityLog" bundle:nil];
    
    SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"SecurityLogHomeVC"];
    [self presentViewController:vc
                       animated:YES
                     completion:nil];


}


-(void)gotoLoginC{
    
    UIStoryboard *secondStroyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SecurityLogHomeVC *vc = [secondStroyBoard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
    

    
}
@end
