//
//  PersonDetailVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/18.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"

@interface PersonDetailVM : BaseViewModel
- (void)getMoreData:(NSString *)idField completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
