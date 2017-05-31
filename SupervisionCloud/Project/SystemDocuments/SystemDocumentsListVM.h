//
//  SystemDocumentsListVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/25.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface SystemDocumentsListVM : BaseTableViewModel

- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
