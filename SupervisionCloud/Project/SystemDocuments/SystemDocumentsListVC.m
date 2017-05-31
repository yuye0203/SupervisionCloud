//
//  SystemDocumentsListVC.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/25.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SystemDocumentsListVC.h"
#import "SystemDocumentsListVM.h"
#import "DocumentsItem.h"

@interface SystemDocumentsListVC ()
@property (nonatomic, strong) SystemDocumentsListVM *sviewModel;

@end

@implementation SystemDocumentsListVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SystemDocumentsListVM *)sviewModel {
    if (_sviewModel == nil) {
        _sviewModel = [[SystemDocumentsListVM alloc]init];
    }
    return _sviewModel;
}

- (void)setupTableView
{
    sWeakSelf
    
    [self.sviewModel handleWithTable:self.table head:^{
        [self.sviewModel getListData:^(BOOL success, NSError *error,id result){
                            if (success) {
                                [self.table reloadData];
                            }
                        }] ;
        
        
    } foot:nil];
    self.sviewModel.goToListDetail = ^(id item){
        [weakSelf goToListDetail:item];
    };
    
    
    
}

-(void)goToListDetail:(id)item {
    
    
//    UIStoryboard *secondStroyBoard=[UIStoryboard storyboardWithName:@"PersonnelManagement" bundle:nil];
//    
//    PersonDetailVC *vc=[secondStroyBoard instantiateViewControllerWithIdentifier:@"PersonDetailVC"];
//    vc.idField = item.idField;
//    [self presentViewController:vc animated:YES completion:nil];
    
}



@end
