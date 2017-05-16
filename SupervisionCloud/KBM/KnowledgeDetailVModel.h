//
//  KnowledgeDetailVModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/16.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"

@interface KnowledgeDetailVModel : BaseViewModel
- (void)getDetailInfo:(NSString *)idField CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
