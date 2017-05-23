//
//  PersonDynamicVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface PersonDynamicVM : BaseTableViewModel
- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)getMoreData:(NSInteger)pageIndex completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
