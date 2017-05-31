//
//  MangerHomeVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/11.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"


@interface MangerHomeVM : BaseTableViewModel

- (void)getRemoveList:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)getQuestionList:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@property (nonatomic, assign) CGFloat tableHeadH;

@end
