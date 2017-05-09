//
//  ToAskViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ToAskViewModel.h"

#import "SVCloudTextViewCell.h"
#import "SVCloudTextFieldCell.h"

static NSString *const TextCell = @"SVCloudTextFieldCell" ;
static NSString *const TextViewCell = @"SVCloudTextViewCell" ;

@interface ToAskViewModel ()


@property (nonatomic, strong) NSMutableArray *dataArrayList;

@end


@implementation ToAskViewModel


- (NSMutableArray *)dataArrayList {
    if (_dataArrayList == nil) {
        _dataArrayList = [NSMutableArray array];
    }
    return _dataArrayList;
}

- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    [UITableViewCell smk_registerTable:table nibIdentifier:TextCell];
    [UITableViewCell smk_registerTable:table nibIdentifier:TextViewCell];
//    [UITableViewCell smk_registerTable:table nibIdentifier:MyCellIdentifier];

}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            SVCloudTextFieldCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath] ;
            return textFieldCell;
        }
            case 1:
        {
            SVCloudTextViewCell *textViewCell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath] ;
            return textViewCell;
        }
 
        default:
            break;
    }
    
    SVCloudTextFieldCell *textFieldCell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath] ;
    return textFieldCell;

}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    KnowledgeModel *itemModle;
//    id model = self.dataArrayList[indexPath.section][indexPath.row];
//    
//    if (indexPath.section==1) {
//        if ([model isKindOfClass:[QuestionModel class]])
//            itemModle = (QuestionModel *)model;
//        else
//            itemModle = [QuestionModel mj_objectWithKeyValues:model];
//    }else{
//        if ([model isKindOfClass:[KnowledgeModel class]])
//            itemModle = (KnowledgeModel *)model;
//        else
//            itemModle = [KnowledgeModel mj_objectWithKeyValues:model];
//        
//    }
//    if (self.goToDetail) {
//        self.goToDetail(itemModle);
//    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

@end
