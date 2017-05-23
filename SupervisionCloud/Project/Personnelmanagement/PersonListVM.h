//
//  PersonListVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"
#import "PersonItem.h"

typedef void(^GotoDetailBlock)(PersonItem* item);

@interface PersonListVM : BaseTableViewModel

- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)getMoreData:(NSInteger)pageIndex completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@property (nonatomic, copy) GotoDetailBlock  goToListDetail;

@end
