//
//  FindQuestionVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface FindQuestionVM : BaseTableViewModel

- (void)getListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
