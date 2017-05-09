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
#import "SVCloudSelectorCell.h"
#import "SVCloudImageCollectionCell.h"

static NSString *const TextCell = @"SVCloudTextFieldCell" ;
static NSString *const TextViewCell = @"SVCloudTextViewCell" ;
static NSString *const SelectorCell = @"SVCloudSelectorCell" ;

@interface ToAskViewModel ()<UICollectionViewDelegate,UICollectionViewDataSource>{
    NSString *pushImageName;

}


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
    [UITableViewCell smk_registerTable:table nibIdentifier:SelectorCell];

}
-(void)handWithCollectionView:(UICollectionView *)collection{
    collection.delegate = self;
    collection.dataSource = self;

}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.row) {
        case 0:
        {
            SVCloudSelectorCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectorCell forIndexPath:indexPath] ;
            cell.titleLabel.text = @"类型";
            cell.summaryLabel.placeholder = @"请选择类型";
        
            return cell;
        }
        case 1:{
            SVCloudTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath] ;
            cell.typeName.text = @"问题";
            cell.textField.placeholder = @"请输入您的问题";
            return cell;

        }
            case 2:
        {
            SVCloudTextViewCell *textViewCell = [tableView dequeueReusableCellWithIdentifier:TextViewCell forIndexPath:indexPath] ;
            textViewCell.typeName.text = @"描述";
            textViewCell.textView.placeholder = @"请输入问题描述";
            return textViewCell;
        }
 
    }
    return nil;
    
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        case 1:
            
            return 45;
            break;
        case 2:
            return 85;
    }
    return 44;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _imageArray.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // Register nib file for the cell
    UINib *nib = [UINib nibWithNibName:@"SVCloudImageCollectionCell" bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"SVCloudImageCollectionCell"];
    // Set up the reuse identifier
    SVCloudImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"SVCloudImageCollectionCell" forIndexPath:indexPath];
    
    if (indexPath.row == _imageArray.count) {
        [cell.profilePhoto setImage:[UIImage imageNamed:pushImageName]];
        cell.closeButton.hidden = YES;
        
    }
    else{
        [cell.profilePhoto setImage:_imageArray[indexPath.item]];
        cell.closeButton.hidden = NO;
    }
    [cell setBigImageViewWithImage:nil];
    cell.profilePhoto.tag = [indexPath item];
    
    //添加图片cell点击事件
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapProfileImage:)];
    singleTap.numberOfTapsRequired = 1;
    cell.profilePhoto .userInteractionEnabled = YES;
    [cell.profilePhoto  addGestureRecognizer:singleTap];
    cell.closeButton.tag = [indexPath item];
    [cell.closeButton addTarget:self action:@selector(deletePhoto:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
#pragma mark <UICollectionViewDelegate>
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(([UIScreen mainScreen].bounds.size.width-64) /4 ,([UIScreen mainScreen].bounds.size.width-64) /4);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 8, 20, 8);
}

-(void)tapProfileImage:(UITapGestureRecognizer *)singleTap{
}
-(void)deletePhoto:(UITapGestureRecognizer *)singleTap{
}

@end
