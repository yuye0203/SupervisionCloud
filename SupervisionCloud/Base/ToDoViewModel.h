//
//  ToDoViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/7.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseTableViewModel.h"
#import "TodoListCell.h"

static NSString *const MyCellIdentifier = @"TodoListCell" ;  // `cellIdentifier` AND `NibName` HAS TO BE SAME !

@interface ToDoViewModel : BaseTableViewModel


- (void)getToDoListData:(NSDictionary *)paramaters CompletionHandle:(void(^)(BOOL success, NSError *error,id result))completionHandle;

@end
