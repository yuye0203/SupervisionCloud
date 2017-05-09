//
//  MineTableViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "MineTableViewModel.h"
#import "UserInfoManger.h"

#import "UITableView+FDTemplateLayoutCell.h"
#import "MineHeaderCell.h"
#import "UserInfoBody.h"


static NSString *const MyCellIdentifier = @"MineHeaderCell" ;  // `cellIdentifier` AND `NibName` HAS TO BE SAME !
static NSString *const CellIdentifier = @"Cell" ;  // `cellIdentifier` AND `NibName` HAS TO BE SAME !

@interface MineTableViewModel()
@property (nonatomic, strong) UserInfoBody *userInfo;
@end

@implementation MineTableViewModel

- (UserInfoBody *)userInfo {
    if (_userInfo == nil) {
        _userInfo = [UserInfoManger getInfo];
    }
    return _userInfo;
}

- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];
    [UITableViewCell smk_registerTable:table classIdentifier:CellIdentifier];

}
//- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion {
//    if (modelArrayBlock) {
//        self.user = modelArrayBlock();
//        if (completion) {
//            completion();
//        }
//    }
//}
//
//- (id)itemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return self.userInfo;
//}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 5;
            break;
            
        default:
            return 3;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0&&indexPath.row==0) {
        MineHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier forIndexPath:indexPath] ;
        [cell smk_configure:cell model:self.userInfo indexPath:indexPath];
        return cell ;

    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath] ;
        [cell smk_configure:cell model:self.userInfo indexPath:indexPath];
        cell.textLabel.text = @"1111";
        return cell ;

    }
    
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    id item = [self itemAtIndexPath:indexPath] ;
    
    if (indexPath.section==0&&indexPath.row==0) {
        return 95;
    }
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

