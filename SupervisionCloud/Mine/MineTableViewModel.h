//
//  MineTableModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMVVMKit.h"

@interface MineTableModel : NSObject<UITableViewDelegate, UITableViewDataSource>

- (void)handleWithTable:(UITableView *)table;

@end
