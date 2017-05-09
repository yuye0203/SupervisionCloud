//
//  ScreenVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/9.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"

@interface ScreenVM : BaseViewModel

- (void)loadTypeWithType:(NSInteger)type CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)loadStautsCompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
