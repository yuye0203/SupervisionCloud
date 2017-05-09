//
//  KBMVCViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//


#import "BaseTableViewModel.h"
#import "SUIMVVMKit.h"
#import "KnowledgeModel.h"
#import "QuestionModel.h"

typedef void(^GotoMoreBlock)(NSInteger section);
typedef void(^GotoDetailBlock)(KnowledgeModel* item);

@interface KBMVCViewModel : BaseTableViewModel<UITableViewDelegate, UITableViewDataSource>


- (void)getDataWithModelArray:(NSArray *(^)())modelArrayBlock completion:(void (^)())completion;//处理获取数据

- (void)getListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@property (nonatomic, copy) GotoMoreBlock  goToMore;
@property (nonatomic, copy) GotoDetailBlock  goToDetail;

@end
