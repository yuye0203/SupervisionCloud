//
//  ToAskViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMVVMKit.h"
#import "KnowledgeModel.h"
#import "BaseViewModel.h"

typedef void(^DoneBlock)(NSDictionary *request);
typedef void(^AddImage)();
typedef void(^ShowType)(NSArray *types);

@interface ToAskViewModel : BaseViewModel<UITableViewDelegate, UITableViewDataSource>


- (void)handleWithTable:(UITableView *)table;
- (void)handWithCollectionView:(UICollectionView *)collection;
- (void)getQuestionType:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)saveQuestion:(void(^)(BOOL success, NSError *error,id result))completionHandle;


@property (nonatomic, copy) DoneBlock  goToMore;
@property (nonatomic, copy) AddImage  addImageBlock;
@property (nonatomic, copy) ShowType  showTypeBlock;


//选择的图片数据
@property(nonatomic,strong) NSMutableArray *arrSelected;

//方形压缩图image 数组
@property(nonatomic,strong) NSMutableArray * imageArray;

//大图image 数组
@property(nonatomic,strong) NSMutableArray * bigImageArray;

//大图image 二进制
@property(nonatomic,strong) NSMutableArray * bigImgDataArray;

//图片选择器
@property(nonatomic,strong) UIViewController *showActionSheetViewController;

//collectionView所在view
@property(nonatomic,strong) UIView *showInView;

//图片总数量限制
@property(nonatomic,assign) NSInteger maxCount;


@property (nonatomic, assign) NSInteger type;


@end
