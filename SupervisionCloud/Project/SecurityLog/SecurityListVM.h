//
//  SecurityListVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/31.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"

@interface SecurityListVM : BaseViewModel
- (void)getSecurityData:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
