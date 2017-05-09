//
//  MangerHomeView.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MangerHomeView.h"
#import "WJDropdownMenu.h"

@interface MangerHomeView()<WJMenuDelegate>

@property(weak,nonatomic) IBOutlet NSLayoutConstraint *viewWidth;
@property (nonatomic,weak)WJDropdownMenu *menu;

@end

@implementation MangerHomeView
- (void)layoutSubviews{
    [super layoutSubviews];
    self.viewWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds)*2;
    
    [self creatDropMenu];
}
//- (void)setNeedsUpdateConstraints{
//    [super setNeedsUpdateConstraints];
//    self.viewWidth.constant = CGRectGetWidth([UIScreen mainScreen].bounds)*2;
//}
-(void)creatDropMenu{
    WJDropdownMenu *menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    menu.delegate = self;
    [self addSubview:menu];
    self.menu = menu;
    
    // 设置属性(可不设置)
    menu.backGroudColor = [UIColor blackColor];
    menu.TopGroudColor = [UIColor clearColor];
    menu.BottomGroudColor = [UIColor clearColor];

    menu.caverAnimationTime = 0.2;             //  增加了展开动画时间设置   不设置默认是  0.15
    menu.hideAnimationTime = 0.2;              //  增加了缩进动画时间设置   不设置默认是  0.15
    menu.menuTitleFont = 17;                   //  设置menuTitle字体大小    不设置默认是  11
    menu.tableTitleFont = 13;                  //  设置tableTitle字体大小   不设置默认是  10
    menu.cellHeight = 44;                      //  设置tableViewcell高度   不设置默认是  40
    menu.menuArrowStyle = menuArrowStyleSolid; //  旋转箭头的样式(空心箭头 or 实心箭头)
    menu.tableViewMaxHeight = 200;             //  tableView的最大高度(超过此高度就可以滑动显示)
    menu.menuButtonTag = 100;                  //  menu定义了一个tag值如果与本页面的其他button的值有冲突重合可以自定义设置
    menu.CarverViewColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];//设置遮罩层颜色
    menu.selectedColor = [UIColor redColor];   //  选中的字体颜色
    menu.unSelectedColor = [UIColor grayColor];//  未选中的字体颜色
    
#warning 此处有两种方法导入数据 1.第一种是直接导入菜单一级子菜单二级子菜单三级子菜单的所有数据  2.第二种是根据每次点击index的请求数据后返回下一菜单的数据时导入数据一级一级联动的网络请求数据所有的方法都是以net开头
    // 第一种方法一次性导入所有菜单数据
    [self createAllMenuData];
    
    // 第二中方法net网络请求一级一级导入数据，先在此导入菜单数据，然后分别再后面的net开头的代理方法中导入一级一级子菜单的数据
    //[menu netCreateMenuTitleArray:threeMenuTitleArray];
    
}

- (void)createAllMenuData{
    NSArray *firstArrOne = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2",@"A一级菜单3", nil];
    NSArray *firstMenu = [NSArray arrayWithObject:firstArrOne];
   
    [self.menu createOneMenuTitleArray:@[@"11111"] FirstArray:firstMenu];

}

- (void)hideMenu{
    //  点击收缩menu
    [self.menu drawBackMenu];
}

#pragma mark -- 代理方法1 返回点击时对应的index

- (void)menuCellDidSelected:(NSInteger)MenuTitleIndex firstIndex:(NSInteger)firstIndex secondIndex:(NSInteger)secondIndex thirdIndex:(NSInteger)thirdIndex{
    NSLog(@"菜单数:%ld      一级菜单数:%ld      二级子菜单数:%ld  三级子菜单:%ld",MenuTitleIndex,firstIndex,secondIndex,thirdIndex);
    
};


#pragma mark -- 代理方法2 返回点击时对应的内容
- (void)menuCellDidSelected:(NSString *)MenuTitle firstContent:(NSString *)firstContent secondContent:(NSString *)secondContent thirdContent:(NSString *)thirdContent{
    
    NSLog(@"菜单title:%@       一级菜单:%@         二级子菜单:%@    三级子菜单:%@",MenuTitle,firstContent,secondContent,thirdContent);
    
    
//    self.data = [NSMutableArray array];
//    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 1",secondContent]];
//    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 2",secondContent]];
//    [self.data addObject:[NSString stringWithFormat:@"%@ 的 detail data 3",secondContent]];
//    [self.tableView reloadData];
    
};

#pragma mark -- 代理方法3 返回点击时对应的内容和index(合并了方法1和方法2)
- (void)menuCellDidSelected:(NSString *)MenuTitle menuIndex:(NSInteger)menuIndex firstContent:(NSString *)firstContent firstIndex:(NSInteger)firstIndex secondContent:(NSString *)secondContent secondIndex:(NSInteger)secondIndex thirdContent:(NSString *)thirdContent thirdIndex:(NSInteger)thirdIndex{
    NSLog(@"菜单title:%@  titleIndex:%ld,一级菜单:%@    一级菜单Index:%ld,     二级子菜单:%@   二级子菜单Index:%ld   三级子菜单:%@  三级子菜单Index:%ld",MenuTitle,menuIndex,firstContent,firstIndex,secondContent,secondIndex,thirdContent,thirdIndex);
}

// ------------------------------------------  以下是网络点击联动的代理方法可在此一级一级的导入数据，测试方法请打开 if 0 -------------------

#if 0

#pragma mark -- net网络获取数据代理方法返回点击时菜单对应的index(导入子菜单数据)
- (void)netMenuClickMenuIndex:(NSInteger)menuIndex menuTitle:(NSString *)menuTitle{
    
    // 模拟网络加载数据延时0.5秒，相当于传一个menuIndex的参数返回数据之后 调用netLoadFirstArray方法，将网络请求返回数据导入一级数据到菜单
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (menuIndex == 0) {
            
            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2", nil];
            [self.menu netLoadFirstArray:firstArrTwo];
            
        }
        if (menuIndex == 1) {
            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"B一级菜单1",@"B一级菜单2", nil];
            [self.menu netLoadFirstArray:firstArrTwo];
        }
        if (menuIndex == 2) {
            NSArray *firstArrTwo = [NSArray arrayWithObjects:@"C一级菜单1",@"C一级菜单2", nil];
            [self.menu netLoadFirstArray:firstArrTwo];
        }
    });
}


#pragma mark -- net网络获取数据代理方法返回点击时菜单和一级子菜单分别对应的index(导入子菜单数据)
- (void)netMenuClickMenuIndex:(NSInteger)menuIndex menuTitle:(NSString *)menuTitle FirstIndex:(NSInteger)FirstIndex firstContent:(NSString *)firstContent{
    
    // 模拟网络加载数据延时0.5秒，相当于传menuIndex、FirstIndex的两个参数返回数据之后，调用 netLoadSecondArray 方法，将网络请求返回数据导入二级数据到菜单
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (menuIndex == 0) {
            if (FirstIndex == 0) {
                NSArray *secondArrTwo = @[@"A二级菜单11",@"A二级菜单12",@"A二级菜单13",@"A二级菜单14",@"A二级菜单15",@"A二级菜单16",@"A二级菜单17",@"A二级菜单18",@"A二级菜单19",@"A二级菜单20",@"A二级菜单11",@"A二级菜单12",@"A二级菜单13",@"A二级菜单14",@"A二级菜单15",@"A二级菜单16",@"A二级菜单17",@"A二级菜单18",@"A二级菜单19",@"A二级菜单20"];
                [self.menu netLoadSecondArray:secondArrTwo];
            }
            if (FirstIndex == 1) {
                NSArray *secondArrTwo = @[@"A二级菜单21",@"A二级菜单22"];
                [self.menu netLoadSecondArray:secondArrTwo];
            }
        }
        if (menuIndex == 1) {
            if (FirstIndex == 0) {
                NSArray *secondArrTwo = @[@"B二级菜单11",@"B二级菜单12"];
                [self.menu netLoadSecondArray:secondArrTwo];
            }
            if (FirstIndex == 1) {
                NSArray *secondArrTwo = @[@"B二级菜单21",@"B二级菜单22"];
                [self.menu netLoadSecondArray:secondArrTwo];
            }
        }
        if (menuIndex == 2) {
            if (FirstIndex == 0) {
                NSArray *secondArrTwo = @[@"C二级菜单11",@"C二级菜单12"];
                [self.menu netLoadSecondArray:secondArrTwo];
                
            }
            if (FirstIndex == 1) {
                NSArray *secondArrTwo = @[@"C二级菜单21",@"C二级菜单22"];
                [self.menu netLoadSecondArray:secondArrTwo];
            }
        }
        
    });
}


#endif

@end
