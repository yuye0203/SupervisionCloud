//
//  ScheduleHomeListVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/23.
//  Copyright © 2017年 YetingGe. All rights reserved.
//


#import "ScheduleHomeListVC.h"
#import "WJDropdownMenu.h"
#import "LCActionAlertView.h"
#import "PersonListVM.h"
#import "PersonDynamicVM.h"

#import "UserInfoManager.h"
#import "PersonItem.h"
#import "PersonDetailVC.h"

@interface ScheduleHomeListVC ()<WJMenuDelegate>{}

@property (nonatomic, strong) PersonListVM *listViewModel;
@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic,strong)WJDropdownMenu *menu;

@end

@implementation ScheduleHomeListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageIndex = 1;
    
    [self creatDropMenu];
    [self setupListTableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (PersonListVM *)listViewModel {
    if (_listViewModel == nil) {
        _listViewModel = [[PersonListVM alloc]init];
    }
    return _listViewModel;
}

//初始化人员列表vm
- (void)setupListTableView
{
    sWeakSelf
    
    self.listViewModel.goToListDetail = ^(PersonItem *item){
        [weakSelf goToListDetail:item];
        
    };
    
    [self.listViewModel handleWithTable:self.table head:^{
        
        [self.listViewModel getListData:^(BOOL success, NSError *error,id result){
            if (success) {
                _pageIndex++;
                [weakSelf.listViewModel setDataWithModelArray:^NSArray *{
                    return (NSArray *)result;
                } completion:^{
                    [weakSelf.table reloadData];
                }];
                
            }
        }] ;
        
        
    } foot:^{
        [self.listViewModel getMoreData:_pageIndex completionHandle:^(BOOL success, NSError *error,id result){
            if (success) {
                _pageIndex++;
                [weakSelf.listViewModel setMoreDataWithModelArray:^NSArray *{
                    return (NSArray *)result;
                } completion:^{
                    [weakSelf.table reloadData];
                }];
                
            }
        }] ;
    }];
}
//初始化动态vm
//- (void)setupDynamicTableView
//{
//    sWeakSelf
//    
//    [self.dynamicViewModel handleWithTable:self.personnelDynamicT head:^{
//        
//        
//        
//        [self.dynamicViewModel getListData:^(BOOL success, NSError *error,id result){
//            if (success) {
//                _dynamicPageIndex++;
//                [weakSelf.dynamicViewModel setMoreDataWithModelArray:^NSArray *{
//                    return (NSArray *)result;
//                } completion:^{
//                    [weakSelf.personnelDynamicT reloadData];
//                }];
//                
//            }
//        }] ;
//        
//        
//    } foot:^{
//        [self.dynamicViewModel getMoreData:_dynamicPageIndex completionHandle:^(BOOL success, NSError *error,id result){
//            if (success) {
//                _dynamicPageIndex++;
//                [weakSelf.dynamicViewModel setMoreDataWithModelArray:^NSArray *{
//                    return (NSArray *)result;
//                } completion:^{
//                    [weakSelf.personnelDynamicT reloadData];
//                }];
//                
//            }
//        }] ;
//    }];
//}
//


-(void)creatDropMenu{
    
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;
    
    self.menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 60,size_screen.width, 44)];
    self.menu.delegate = self;
    [self.view addSubview:self.menu];
    
    self.menu.backGroudColor = [UIColor whiteColor];
    self.menu.TopGroudColor = [UIColor groupTableViewBackgroundColor];
    self.menu.BottomGroudColor = [UIColor groupTableViewBackgroundColor];
    
    self.menu.caverAnimationTime = 0.2;             //  增加了展开动画时间设置   不设置默认是  0.15
    self.menu.hideAnimationTime = 0.2;              //  增加了缩进动画时间设置   不设置默认是  0.15
    self.menu.menuTitleFont = 15;                   //  设置menuTitle字体大小    不设置默认是  11
    self.menu.tableTitleFont = 13;                  //  设置tableTitle字体大小   不设置默认是  10
    self.menu.cellHeight = 44;                      //  设置tableViewcell高度   不设置默认是  40
    self.menu.menuArrowStyle = menuArrowStyleHollow; //  旋转箭头的样式(空心箭头 or 实心箭头)
    self.menu.tableViewMaxHeight = 200;             //  tableView的最大高度(超过此高度就可以滑动显示)
    self.menu.menuButtonTag = 100;                  //  menu定义了一个tag值如果与本页面的其他button的值有冲突重合可以自定义设置
    self.menu.CarverViewColor = [UIColor colorWithWhite:0 alpha:0.5];//设置遮罩层颜色
    self.menu.selectedColor = [UIColor blueColor];   //  选中的字体颜色
    self.menu.unSelectedColor = [UIColor blackColor];//  未选中的字体颜色
    self.menu.titleColor = [UIColor blackColor];
    self.menu.showSelectTitle = YES;
    
    [self createAllMenuData];
    
}


- (void)createAllMenuData{
    
 
    NSArray *firstMenu = @[@[@"1111",@"22222"]];
    NSArray *seconedMenu = @[@[@"本年",@"本月"]];
    
    [self.menu createTwoMenuTitleArray:@[@"施工合作段",@"本年"] FirstArr:firstMenu SecondArr:seconedMenu];
    
}

- (void)menuCellDidSelected:(NSInteger)MenuTitleIndex firstIndex:(NSInteger)firstIndex secondIndex:(NSInteger)secondIndex thirdIndex:(NSInteger)thirdIndex{

    
    //
    //    NSLog(@"菜单数:%ld      一级菜单数:%ld      二级子菜单数:%ld  三级子菜单:%ld",MenuTitleIndex,firstIndex,secondIndex,thirdIndex);
    
};

-(void)goToListDetail:(PersonItem *)item {
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
    
    PersonDetailVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonDetailVC"];
    vc.idField = item.idField;
    [self presentViewController:vc animated:YES completion:nil];
    
}




@end
