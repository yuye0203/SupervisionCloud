//
//  FirstViewController.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/3/29.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginVC.h"
#import "MangerHomeView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO:判断身份
    //项目经理
    if(/* DISABLES CODE */ (YES)){
   NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
    MangerHomeView *mhome = (MangerHomeView *)[nib objectAtIndex:0];
    self.view = mhome;
    }
    //管理层
    if(/* DISABLES CODE */ (NO)){
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"MangerHomeView" owner:self options:nil];
        MangerHomeView *mhome = (MangerHomeView *)[nib objectAtIndex:0];
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


@end
