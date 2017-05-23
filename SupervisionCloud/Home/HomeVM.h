//
//  HomeVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/10.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeVM : BaseViewModel

- (void)getBannerInfo:(void(^)(BOOL success, NSError *error,id result))completionHandle;

- (void)getUserProject:(void(^)(BOOL success, NSError *error,id result))completionHandle;

- (void)getFunctionList:(void(^)(BOOL success, NSError *error,id result))completionHandle;


@end
