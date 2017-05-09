//
//  ScreenVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ScreenVC.h"
#import "SVCloudTextFieldCell.h"
#import "SVCloudSelectorCell.h"
#import "SVCloudDateCell.h"
#import "UITableViewCell+SMKConfigure.h"
#import "ScreenVM.h"

static NSString *const DateCellIdentifier = @"SVCloudDateCell" ;
static NSString *const SelectorIdentifier = @"SVCloudSelectorCell" ;
static NSString *const TextIdentifier = @"SVCloudTextFieldCell" ;

@interface ScreenVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)IBOutlet TPKeyboardAvoidingTableView *tableV;
@property(nonatomic,strong)NSMutableArray  *conArr;
@property(nonatomic,strong)NSMutableArray  *resultArr;
@property (nonatomic, strong) ScreenVM *sviewModel;

@end


@implementation ScreenVC

-(NSMutableArray *)conArr{
    if (!_conArr) {
        _conArr = [NSMutableArray arrayWithCapacity:4];
    }
    return _conArr;
}
- (ScreenVM *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[ScreenVM alloc]init];
    }
    return _sviewModel;
}

-(void)viewDidLoad
{
   
    [super viewDidLoad];
    [self creatTable];
    
}
-(void)creatTable{
    _tableV.delegate = self;
    _tableV.dataSource = self;
    
    [UITableViewCell smk_registerTable:_tableV nibIdentifier:DateCellIdentifier];
    [UITableViewCell smk_registerTable:_tableV nibIdentifier:SelectorIdentifier];
    [UITableViewCell smk_registerTable:_tableV nibIdentifier:TextIdentifier];
    
    if (_fromType==1) {
        self.conArr = [@[@{@"name":@"条件",@"place":@"请选择",@"result":@"",@"type":@1},
                         @{@"name":@"类型",@"place":@"请选择",@"result":@"",@"type":@1},
                         @{@"name":@"时间",@"place":@"请选择",@"result":@"",@"type":@2},
                         @{@"name":@"关键字",@"place":@"请输入关键字",@"result":@"",@"type":@3}] mutableCopy];
        
        [self.sviewModel loadStautsCompletionHandle:^(BOOL success, NSError *error,id result){
        }];
        
    }else
        self.conArr = [@[
                         @{@"name":@"类型",@"place":@"请选择",@"result":@"",@"type":@1},
                         @{@"name":@"时间",@"place":@"请选择",@"result":@"",@"type":@2},
                         @{@"name":@"关键字",@"place":@"请输入关键字",@"result":@"",@"type":@3}] mutableCopy];
    
    [self.sviewModel loadTypeWithType:self.fromType                         CompletionHandle:^(BOOL success, NSError *error,id result){
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.conArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSDictionary *dic = self.conArr[indexPath.row];
    switch ([dic[@"type"] intValue]) {
        case 1:
            
            cell = [tableView dequeueReusableCellWithIdentifier:SelectorIdentifier forIndexPath:indexPath] ;
            

            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:DateCellIdentifier forIndexPath:indexPath] ;

            break;
            
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:TextIdentifier forIndexPath:indexPath] ;
            break;
    }
    [cell smk_configure:cell model:self.conArr[indexPath.row] indexPath:indexPath];

    
    return cell ;
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
