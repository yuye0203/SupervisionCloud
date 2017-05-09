//
//  LoginVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/8.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"


@interface LoginVM : BaseViewModel
- (void)loginAction:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
