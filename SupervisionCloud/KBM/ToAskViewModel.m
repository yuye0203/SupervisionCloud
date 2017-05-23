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
#import "HWImagePickerSheet.h"
#import "UIViewAdditions.h"
#import "JJPhotoManeger.h"
#import "UserInfoManager.h"
#import "BaseModel.h"
#import "QuestionType.h"
#import "MJExtension.h"
#import "LCActionAlertView.h"

static NSString *const TextCell = @"SVCloudTextFieldCell" ;
static NSString *const TextViewCell = @"SVCloudTextViewCell" ;
static NSString *const SelectorCell = @"SVCloudSelectorCell" ;

@interface ToAskViewModel ()<UICollectionViewDelegate,UICollectionViewDataSource,HWImagePickerSheetDelegate,JJPhotoDelegate>{
    NSInteger selectIndex;

}

//选择图片
@property (nonatomic, strong) HWImagePickerSheet *imgPickerActionSheet;

@property (nonatomic, strong) NSMutableArray *dataArrayList;
@property (nonatomic, strong) NSMutableArray *resultDic;


@property (nonatomic, strong) UICollectionView *pickerCollectionView;

@property (nonatomic, strong) UITableView *table;



@end


@implementation ToAskViewModel


- (NSMutableArray *)dataArrayList {
    if (_dataArrayList == nil) {
        _dataArrayList = [NSMutableArray array];
    }
    return _dataArrayList;
}

- (NSMutableArray *)resultDic {
    if (_resultDic == nil) {
        _resultDic = [@[@{@"name":@"类型",@"result":@"",@"pe":@"请选择类型"},
  @{@"name":@"问题",@"result":@"",@"pe":@"请输入您的问题"},
  @{@"name":@"描述",@"result":@"",@"pe":@"请选择类型"}] mutableCopy];
    }
    return _resultDic;
}

- (void)handleWithTable:(UITableView *)table {
    table.delegate = self;
    table.dataSource = self;
    self.table = table;
    [UITableViewCell smk_registerTable:table nibIdentifier:TextCell];
    [UITableViewCell smk_registerTable:table nibIdentifier:TextViewCell];
    [UITableViewCell smk_registerTable:table nibIdentifier:SelectorCell];

}
-(void)handWithCollectionView:(UICollectionView *)collection{
    collection.delegate = self;
    collection.dataSource = self;
    self.pickerCollectionView = collection;

}
- (void)getQuestionType:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
    NSMutableDictionary *paramaters = [@{@"cmd":@"questionType"} mutableCopy];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:paramaters
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  
                  NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                           options:NSJSONReadingMutableLeaves
                                                                             error:nil];
                  
                  BaseModel *root = [BaseModel creatWithDic:jsonDict];
                  
                  if (root.resultCode ==1) {
                      NSArray * array = [QuestionType mj_objectArrayWithKeyValuesArray:root.body];
                      self.dataArrayList = [array mutableCopy];
                      completionHandle(YES, nil, array);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
}

- (void)saveQuestion:(void(^)(BOOL success, NSError *error,id result))completionHandle{
    
    NSDate *datenow = [NSDate date];
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)((double)[datenow timeIntervalSince1970]*1000)];
    
    
//    cmd		string	指定值：addQuestion	TRUE
//    user_id		int	用户id	TRUE
//    auth_token		string		TRUE
//    title		string	标题	TRUE
//    type		int	类型	TRUE
//    file		array	附件（数组）	FALSE
//    desc		string	详情	TRUE
//    verify		string	加密字符串	TRUE	参考加密说明
    
    NSIndexPath *index1 = [NSIndexPath indexPathForRow:1 inSection:0];
    NSIndexPath *index2 = [NSIndexPath indexPathForRow:2 inSection:0];


    SVCloudTextFieldCell *textCell  = [self.table cellForRowAtIndexPath:index1];
    SVCloudTextViewCell *textViewCell  = [self.table cellForRowAtIndexPath:index2];
    
    NSString *title = textCell.textField.text;
    NSString *subTitle = textViewCell.textView.text;


    UserInfoBody *user = [UserInfoManager getInfo];
    
    NSMutableDictionary *paramaters = [@{@"cmd":@"addQuestion",
                                         @"auth_token":user.authToken,
                                         @"user_id":[NSNumber numberWithInteger:[user.idField integerValue]],
                                         @"title":title,
                                         @"type":@"",
                                         @"desc":subTitle,
                                         } mutableCopy];
    
    
    NSData *data =    [NSJSONSerialization dataWithJSONObject:[self parametersWithDic:paramaters]
                                                      options:NSJSONWritingPrettyPrinted error:nil];
    
    [self postWithUrl:timeSp
                 body:data
          showLoading:NO
              success:^(NSDictionary *response) {
                  
                  NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:(NSData *)response
                                                                           options:NSJSONReadingMutableLeaves
                                                                             error:nil];
                  
                  BaseModel *root = [BaseModel creatWithDic:jsonDict];
                  
                  if (root.resultCode ==1) {
                      
                      completionHandle(YES, nil, nil);
                      
                  }else
                      completionHandle(NO, nil, root.resultMessage);
                  
                  
              } failure:^(NSError *error) {
                  
                  completionHandle(NO, error, nil);
              }];
    
    
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
    
    NSDictionary *dic = self.resultDic[indexPath.row];
    switch (indexPath.row) {
        case 0:
        {
            SVCloudSelectorCell *cell = [tableView dequeueReusableCellWithIdentifier:SelectorCell forIndexPath:indexPath] ;
            cell.titleLabel.text = dic[@"name"];
            cell.summaryLabel.placeholder = dic[@"pe"];
            cell.summaryLabel.text = dic[@"result"];

        
            return cell;
        }
        case 1:{
            SVCloudTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:TextCell forIndexPath:indexPath] ;
            cell.typeName.text = dic[@"name"];
            cell.textField.placeholder = dic[@"pe"];
            cell.textField.text = dic[@"result"];

            return cell;

        }
            case 2:
        {
            SVCloudTextViewCell *textViewCell = [tableView dequeueReusableCellWithIdentifier:TextViewCell forIndexPath:indexPath] ;
            
            textViewCell.typeName.text = dic[@"name"];
            textViewCell.textView.placeholder = dic[@"pe"];
            textViewCell.textView.text = dic[@"result"];

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
    
    if(indexPath.row==0){
        NSMutableArray *names = [NSMutableArray array];

        for (QuestionType *type in self.dataArrayList) {
            [names addObject:type.name];
        }
        [LCActionAlertView showActionViewNames:names completed:^(NSInteger index,NSString * name) {
            //类型选择
            selectIndex = index;
            NSMutableDictionary *dic = [_resultDic[indexPath.row] mutableCopy];
            [dic setObject:name forKey:@"result"];
            
            [_resultDic replaceObjectAtIndex:0 withObject:dic];
            [tableView reloadData];
            NSLog(@"%ld",index);
        } canceled:^{
        }];

    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 4;
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
        [cell.profilePhoto setImage:[UIImage imageNamed:@"zhaopian"]];
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
    CGFloat width = collectionView.width;
    return CGSizeMake(width/4 ,width/4);
}

//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(8, 8, 0, 8);
}

- (void) tapProfileImage:(UITapGestureRecognizer *)gestureRecognizer{
//    [self endEditing:YES];
    
    UIImageView *tableGridImage = (UIImageView*)gestureRecognizer.view;
    NSInteger index = tableGridImage.tag;
    
    if (index == (_imageArray.count)) {
        [self addNewImg];
        //添加新图片
        if (self.addImageBlock) {
            self.addImageBlock();
        }
    }
    else{
        //点击放大查看
        SVCloudImageCollectionCell *cell = (SVCloudImageCollectionCell*)[_pickerCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0]];
        if (!cell.BigImageView || !cell.BigImageView.image) {
            
            [cell setBigImageViewWithImage:[self getBigIamgeWithALAsset:_arrSelected[index]]];
        }
        
        JJPhotoManeger *mg = [JJPhotoManeger maneger];
        mg.delegate = self;
        [mg showLocalPhotoViewer:@[cell.BigImageView] selecImageindex:0];
    }
}
- (void)addNewImg{
    if (!_imgPickerActionSheet) {
        _imgPickerActionSheet = [[HWImagePickerSheet alloc] init];
        _imgPickerActionSheet.delegate = self;
    }
    if (_arrSelected) {
        _imgPickerActionSheet.arrSelected = _arrSelected;
    }
    _imgPickerActionSheet.maxCount = _maxCount;
    [_imgPickerActionSheet showImgPickerActionSheetInView:_showActionSheetViewController];
}
- (void)deletePhoto:(UIButton *)sender{
    
    [_imageArray removeObjectAtIndex:sender.tag];
    [_arrSelected removeObjectAtIndex:sender.tag];
    
    [self.pickerCollectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:sender.tag inSection:0]]];
    
    for (NSInteger item = sender.tag; item <= _imageArray.count; item++) {
        SVCloudImageCollectionCell *cell = (SVCloudImageCollectionCell*)[self.pickerCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:item inSection:0]];
        cell.closeButton.tag--;
        cell.profilePhoto.tag--;
    }
    
}

/**
 *  相册完成选择得到图片
 */
-(void)getSelectImageWithALAssetArray:(NSArray *)ALAssetArray thumbnailImageArray:(NSArray *)thumbnailImgArray{
    //（ALAsset）类型 Array
    _arrSelected = [NSMutableArray arrayWithArray:ALAssetArray];
    //正方形缩略图 Array
    _imageArray = [NSMutableArray arrayWithArray:thumbnailImgArray] ;
    
    [self.pickerCollectionView reloadData];
}
- (void)pickerViewFrameChanged{
    
}

#pragma mark - 防止奔溃处理
-(void)photoViwerWilldealloc:(NSInteger)selecedImageViewIndex
{
    NSLog(@"最后一张观看的图片的index是:%zd",selecedImageViewIndex);
}

- (UIImage *)compressImage:(UIImage *)image toMaxFileSize:(NSInteger)maxFileSize {
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    while ([imageData length] > maxFileSize && compression > maxCompression) {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}
//获得大图
- (NSArray*)getBigImageArrayWithALAssetArray:(NSArray*)ALAssetArray{
    _bigImgDataArray = [NSMutableArray array];
    NSMutableArray *bigImgArr = [NSMutableArray array];
    for (ALAsset *set in ALAssetArray) {
        [bigImgArr addObject:[self getBigIamgeWithALAsset:set]];
    }
    _bigImageArray = bigImgArr;
    return _bigImageArray;
}
- (UIImage*)getBigIamgeWithALAsset:(ALAsset*)set{
    //压缩
    // 需传入方向和缩放比例，否则方向和尺寸都不对
    UIImage *img = [UIImage imageWithCGImage:set.defaultRepresentation.fullResolutionImage
                                       scale:set.defaultRepresentation.scale
                                 orientation:(UIImageOrientation)set.defaultRepresentation.orientation];
    NSData *imageData = UIImageJPEGRepresentation(img, 0.5);
    [_bigImgDataArray addObject:imageData];
    
    return [UIImage imageWithData:imageData];
}

#pragma mark - 获得选中图片各个尺寸
- (NSArray*)getALAssetArray{
    return _arrSelected;
}

- (NSArray*)getBigImageArray{
    
    return [self getBigImageArrayWithALAssetArray:_arrSelected];
}

- (NSArray*)getSmallImageArray{
    return _imageArray;
}

- (CGRect)getPickerViewFrame{
    return self.pickerCollectionView.frame;
}



@end
