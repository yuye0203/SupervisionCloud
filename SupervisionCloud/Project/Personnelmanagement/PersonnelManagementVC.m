//
//  PersonnelManagementVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "PersonnelManagementVC.h"
#import "WJDropdownMenu.h"
#import "LCActionAlertView.h"
#import "PersonListVM.h"
#import "PersonDynamicVM.h"

#import "UserInfoManager.h"
#import "PersonItem.h"
#import "PersonDetailVC.h"

@interface PersonnelManagementVC ()<WJMenuDelegate>{}
@property(nonatomic,weak)IBOutlet UITableView *personnelListV;
@property(nonatomic,weak)IBOutlet UITableView *personnelDynamicT;

@property(nonatomic,weak)IBOutlet UIView *personnelDynamicV;
@property(nonatomic,weak)IBOutlet UIButton *searchItem;
@property(nonatomic,weak)IBOutlet UIButton *addItem;
@property(nonatomic,weak)IBOutlet UINavigationItem *titleItem;
@property(nonatomic,weak)IBOutlet UIButton *listBtn;
@property(nonatomic,weak)IBOutlet UIButton *dynamicBtn;


@property (nonatomic, strong) PersonListVM *listViewModel;
@property (nonatomic, strong) PersonDynamicVM *dynamicViewModel;

@property (nonatomic, assign) NSInteger listPageIndex;
@property (nonatomic, assign) NSInteger dynamicPageIndex;

@property (nonatomic,strong)WJDropdownMenu *menu;

@end

@implementation PersonnelManagementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _listPageIndex = 1;
    _dynamicPageIndex = 1;
    
    [self creatDropMenu];
    [self setupListTableView];
    [self setupDynamicTableView];
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
- (PersonDynamicVM *)dynamicViewModel {
    if (_dynamicViewModel == nil) {
        _dynamicViewModel = [[PersonDynamicVM alloc]init];
    }
    return _dynamicViewModel;
}


//初始化人员列表vm
- (void)setupListTableView
{
    sWeakSelf

    self.listViewModel.goToListDetail = ^(PersonItem *item){
        [weakSelf goToListDetail:item];

    };
    [self.listViewModel handleWithTable:self.personnelListV head:^{
        
        
        
        [self.listViewModel getListData:^(BOOL success, NSError *error,id result){
                        if (success) {
                            _listPageIndex++;
                            [weakSelf.listViewModel setDataWithModelArray:^NSArray *{
                                return (NSArray *)result;
                            } completion:^{
                                [weakSelf.personnelListV reloadData];
                            }];

                        }
                    }] ;
        
        
    } foot:^{
        [self.listViewModel getMoreData:_listPageIndex completionHandle:^(BOOL success, NSError *error,id result){
                        if (success) {
                            _listPageIndex++;
                            [weakSelf.listViewModel setMoreDataWithModelArray:^NSArray *{
                                return (NSArray *)result;
                            } completion:^{
                                [weakSelf.personnelListV reloadData];
                            }];

                        }
                    }] ;
    }];
}
//初始化动态vm
- (void)setupDynamicTableView
{
    sWeakSelf
    
    [self.dynamicViewModel handleWithTable:self.personnelDynamicT head:^{
        
        
        
        [self.dynamicViewModel getListData:^(BOOL success, NSError *error,id result){
            if (success) {
                _dynamicPageIndex++;
                [weakSelf.dynamicViewModel setMoreDataWithModelArray:^NSArray *{
                    return (NSArray *)result;
                } completion:^{
                    [weakSelf.personnelDynamicT reloadData];
                }];

            }
        }] ;
        
        
    } foot:^{
        [self.dynamicViewModel getMoreData:_dynamicPageIndex completionHandle:^(BOOL success, NSError *error,id result){
            if (success) {
                _dynamicPageIndex++;
                [weakSelf.dynamicViewModel setMoreDataWithModelArray:^NSArray *{
                    return (NSArray *)result;
                } completion:^{
                    [weakSelf.personnelDynamicT reloadData];
                }];
                
            }
        }] ;
    }];
}



-(IBAction)showpersonnelList:(id)sender{
    _listBtn.selected = YES;
    _dynamicBtn.selected = NO;
    _personnelListV.hidden = NO;
    _personnelDynamicV.hidden = YES;
    _searchItem.hidden = NO;
    _addItem.hidden = NO;
    _titleItem.title = @"人员";
}
-(IBAction)showpersonnelDynamic:(id)sender{
    _listBtn.selected = NO;
    _dynamicBtn.selected = YES;

    _personnelListV.hidden = YES;
    _personnelDynamicV.hidden = NO;
    _searchItem.hidden = YES;
    _addItem.hidden = YES;
    _titleItem.title = @"人员动态";

}

-(void)creatDropMenu{
    
    CGSize size_screen = [[UIScreen mainScreen] bounds].size;
    
    self.menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 0,size_screen.width, 44)];
    self.menu.delegate = self;
    [_personnelDynamicV addSubview:self.menu];
    
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
    self.menu.showSelectTitle = NO;

    [self createAllMenuData];
    
}


- (void)createAllMenuData{
   
//    NSMutableArray *temp = [NSMutableArray arrayWithCapacity:list.count];
//    NSString *name = @"";
//    self.projectArr = list;
//    for (Project *item in list) {
//        [temp addObject:item.projectName];
//    }
//    NSArray *firstArrOne = temp;
//    name = temp[0];
    NSArray *firstMenu = @[@[@"项目人员",@"时间"]];
    NSArray *seconedMenu = @[@[@"项目人员",@"时间"]];

    [self.menu createTwoMenuTitleArray:@[@"项目人员",@"时间"] FirstArr:firstMenu SecondArr:seconedMenu];
    
}
-(IBAction)showAddView{
    
    NSArray *types = @[@"申请人员",@"申请撤场",@"查看申请人员"];
    [LCActionAlertView showActionViewNames:types completed:^(NSInteger index,NSString * name) {
        //类型选择
//        selectIndex = index;
//        NSMutableDictionary *dic = [_resultDic[indexPath.row] mutableCopy];
//        [dic setObject:name forKey:@"result"];
//        
//        [_resultDic replaceObjectAtIndex:0 withObject:dic];
//        [tableView reloadData];
//        NSLog(@"%ld",index);
    } canceled:^{
    }];
    
}
-(void)goToListDetail:(PersonItem *)item {
    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
    
    PersonDetailVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonDetailVC"];
    vc.idField = item.idField;
    [self presentViewController:vc animated:YES completion:nil];

}




@end
