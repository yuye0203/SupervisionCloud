//
//  MangerHomeView.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MangerHomeView.h"
#import "WJDropdownMenu.h"
#import "Project.h"
#import "ManagerProject.h"
#import "Banner.h"
#import "HomeActivityView.h"
#import "MangerHomeVM.h"

@interface MangerHomeView()<WJMenuDelegate>

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *viewWidth;
@property (weak, nonatomic)IBOutlet UIView *activtiyView;
@property(weak,nonatomic) IBOutlet UITableView *table;
@property (nonatomic, strong) MangerHomeVM *viewModel;

@property (nonatomic,strong)WJDropdownMenu *menu;

@end

@implementation MangerHomeView
-(NSArray *)projectArr{
    if (_projectArr==nil) {
        _projectArr= [NSArray array];
    }
    return _projectArr;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.viewWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds)*2;
    
}

-(void)creatDropMenu{
  
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;

    self.menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 20,size_screen.width, 44)];
    self.menu.delegate = self;
    [self addSubview:self.menu];
    
    self.menu.backGroudColor = [UIColor clearColor];
    self.menu.TopGroudColor = [UIColor clearColor];
    self.menu.BottomGroudColor = [UIColor clearColor];

    self.menu.caverAnimationTime = 0.2;             //  增加了展开动画时间设置   不设置默认是  0.15
    self.menu.hideAnimationTime = 0.2;              //  增加了缩进动画时间设置   不设置默认是  0.15
    self.menu.menuTitleFont = 17;                   //  设置menuTitle字体大小    不设置默认是  11
    self.menu.tableTitleFont = 15;                  //  设置tableTitle字体大小   不设置默认是  10
    self.menu.cellHeight = 44;                      //  设置tableViewcell高度   不设置默认是  40
    self.menu.menuArrowStyle = menuArrowStyleHollow; //  旋转箭头的样式(空心箭头 or 实心箭头)
    self.menu.tableViewMaxHeight = 200;             //  tableView的最大高度(超过此高度就可以滑动显示)
    self.menu.menuButtonTag = 100;                  //  menu定义了一个tag值如果与本页面的其他button的值有冲突重合可以自定义设置
    self.menu.CarverViewColor = [UIColor clearColor];//设置遮罩层颜色
    self.menu.selectedColor = [UIColor blueColor];   //  选中的字体颜色
    self.menu.unSelectedColor = [UIColor blackColor];//  未选中的字体颜色
    self.menu.titleColor = [UIColor whiteColor];
    
}
- (MangerHomeVM *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [[MangerHomeVM alloc]init];
    }
    return _viewModel;
}

- (void)setupTableView
{
    [self.viewModel handleWithTable:self.table head:^{
        [self.viewModel getRemoveList:^(BOOL success, NSError *error,id result){
            NSLog(@"getRemoveList");
            if (success) {
                [self.table reloadData];
            }
        }];
        [self.viewModel getQuestionList:^(BOOL success, NSError *error,id result){
            NSLog(@"getRemoveList");
            if (success) {
                [self.table reloadData];
            }
        }];
        
    } foot:nil];
    
}

- (void)createAllMenuData:(NSArray *)list{
    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:list.count];
    NSString *name = @"";
    self.projectArr = list;
    for (Project *item in list) {
        [temp addObject:item.projectName];
    }
    NSArray *firstArrOne = temp;
    name = temp[0];
    NSArray *firstMenu = [NSArray arrayWithObject:firstArrOne];
   
    [self.menu createOneMenuTitleArray:@[name] FirstArray:firstMenu];

}
-(void)setBannerInfo:(Banner *)item{
   
    self.planL.text = item.plan;
    self.contractNumL.text = item.contract.contractNumber;
    self.startTimeL.text = item.contract.startTime;
    self.dynamicTL.text = item.dynamic.today;
    self.dynamicML.text = item.dynamic.mouth;
}

- (void)setActivtiyViews:(NSArray *)list{
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;

    float width = size_screen.width/5;
    
    while (_activtiyView.subviews.count) {
        UIView* child = _activtiyView.subviews.lastObject;
        [child removeFromSuperview];
    }

    for (int i=0; i < list.count; i++) {
        HomeActivityView *activityView = [[HomeActivityView alloc] initWithFrame:CGRectMake(width*(i%5), (width+0)*(i/5), width, width+0) data:list[i]];
        [_activtiyView addSubview:activityView];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:activityView.frame];
        [btn setTag:i];
//        [btn addTarget:self action:@selector(clickActivity:) forControlEvents:UIControlEventTouchUpInside];
        [_activtiyView addSubview:btn];
    }
}


- (void)hideMenu{
    //  点击收缩menu
    [self.menu drawBackMenu];
}

#pragma mark -- 代理方法1 返回点击时对应的index

- (void)menuCellDidSelected:(NSInteger)MenuTitleIndex firstIndex:(NSInteger)firstIndex secondIndex:(NSInteger)secondIndex thirdIndex:(NSInteger)thirdIndex{
    Project *project = self.projectArr[firstIndex];
    [ManagerProject saveProject:project];
                           
//    NSLog(@"菜单数:%ld      一级菜单数:%ld      二级子菜单数:%ld  三级子菜单:%ld",MenuTitleIndex,firstIndex,secondIndex,thirdIndex);
    
};


//#pragma mark -- 代理方法2 返回点击时对应的内容
//- (void)menuCellDidSelected:(NSString *)MenuTitle firstContent:(NSString *)firstContent secondContent:(NSString *)secondContent thirdContent:(NSString *)thirdContent{
//    
////    NSLog(@"菜单title:%@       一级菜单:%@         二级子菜单:%@    三级子菜单:%@",MenuTitle,firstContent,secondContent,thirdContent);
//    
//    
////    self.data = [NSMutableArray array];
////    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 1",secondContent]];
////    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 2",secondContent]];
////    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 3",secondContent]];
////    [self.tableView reloadData];
//    
//};
//
//#pragma mark -- 代理方法3 返回点击时对应的内容和index(合并了方法1和方法2)
//- (void)menuCellDidSelected:(NSString *)MenuTitle menuIndex:(NSInteger)menuIndex firstContent:(NSString *)firstContent firstIndex:(NSInteger)firstIndex secondContent:(NSString *)secondContent secondIndex:(NSInteger)secondIndex thirdContent:(NSString *)thirdContent thirdIndex:(NSInteger)thirdIndex{
////    NSLog(@"菜单title:%@  titleIndex:%ld,一级菜单:%@    一级菜单Index:%ld,     二级子菜单:%@   二级子菜单Index:%ld   三级子菜单:%@  三级子菜单Index:%ld",MenuTitle,menuIndex,firstContent,firstIndex,secondContent,secondIndex,thirdContent,thirdIndex);
//}
//
//// ------------------------------------------  以下是网络点击联动的代理方法可在此一级一级的导入数据，测试方法请打开 if 0 -------------------
//
//#if 0
//
//#pragma mark -- net网络获取数据代理方法返回点击时菜单对应的index(导入子菜单数据)
//- (void)netMenuClickMenuIndex:(NSInteger)menuIndex menuTitle:(NSString *)menuTitle{
//    
//    // 模拟网络加载数据延时0.5秒，相当于传一个menuIndex的参数返回数据之后 调用netLoadFirstArray方法，将网络请求返回数据导入一级数据到菜单
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        if (menuIndex == 0) {
//            
//            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2", nil];
//            [self.menu netLoadFirstArray:firstArrTwo];
//            
//        }
//        if (menuIndex == 1) {
//            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"B一级菜单1",@"B一级菜单2", nil];
//            [self.menu netLoadFirstArray:firstArrTwo];
//        }
//        if (menuIndex == 2) {
//            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"C一级菜单1",@"C一级菜单2", nil];
//            [self.menu netLoadFirstArray:firstArrTwo];
//        }
//    });
//}
//
//
//#pragma mark -- net网络获取数据代理方法返回点击时菜单和一级子菜单分别对应的index(导入子菜单数据)
//- (void)netMenuClickMenuIndex:(NSInteger)menuIndex menuTitle:(NSString *)menuTitle FirstIndex:(NSInteger)FirstIndex firstContent:(NSString *)firstContent{
//    
//    // 模拟网络加载数据延时0.5秒，相当于传menuIndex、FirstIndex的两个参数返回数据之后，调用 netLoadSecondArray 方法，将网络请求返回数据导入二级数据到菜单
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        if (menuIndex == 0) {
//            if (FirstIndex == 0) {
//                NSArray *secondArrTwo = @[@"A二级菜单11",@"A二级菜单12",@"A二级菜单13",@"A二级菜单14",@"A二级菜单15",@"A二级菜单16",@"A二级菜单17",@"A二级菜单18",@"A二级菜单19",@"A二级菜单20",@"A二级菜单11",@"A二级菜单12",@"A二级菜单13",@"A二级菜单14",@"A二级菜单15",@"A二级菜单16",@"A二级菜单17",@"A二级菜单18",@"A二级菜单19",@"A二级菜单20"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//            }
//            if (FirstIndex == 1) {
//                NSArray *secondArrTwo = @[@"A二级菜单21",@"A二级菜单22"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//            }
//        }
//        if (menuIndex == 1) {
//            if (FirstIndex == 0) {
//                NSArray *secondArrTwo = @[@"B二级菜单11",@"B二级菜单12"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//            }
//            if (FirstIndex == 1) {
//                NSArray *secondArrTwo = @[@"B二级菜单21",@"B二级菜单22"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//            }
//        }
//        if (menuIndex == 2) {
//            if (FirstIndex == 0) {
//                NSArray *secondArrTwo = @[@"C二级菜单11",@"C二级菜单12"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//                
//            }
//            if (FirstIndex == 1) {
//                NSArray *secondArrTwo = @[@"C二级菜单21",@"C二级菜单22"];
//                [self.menu netLoadSecondArray:secondArrTwo];
//            }
//        }
//        
//    });
//}
//
//
//#endif

@end
