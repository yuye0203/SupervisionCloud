//
//  QuestionDetailVM.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/6/1.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"

@interface QuestionDetailVM : BaseTableViewModel

- (void)getDetailInfo:(NSString *)idField CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

- (void)getListData:(void(^)(BOOL success, NSError *error,id result))completionHandle;

- (void)getMoreData:(NSInteger)pageIndex completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

- (void)answerQuestion:(NSString *)answer completionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;
- (void)zanAction:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@property (nonatomic, strong) NSString *idField;


@end
