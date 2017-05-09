//
//  ToAskViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/6.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMVVMKit.h"
#import "KnowledgeModel.h"
typedef void(^DoneBlock)(NSDictionary *request);

@interface ToAskViewModel : NSObject<UITableViewDelegate, UITableViewDataSource>


- (void)handleWithTable:(UITableView *)table;


@property (nonatomic, copy) DoneBlock  goToMore;

@end
