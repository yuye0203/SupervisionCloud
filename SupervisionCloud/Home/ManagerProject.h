//
//  ManagerProject.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/10.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Project.h"

@interface ManagerProject : NSObject
// 是否获取project
+ (BOOL)isGetProject;

+(Project *)getProject;

+ (void)saveProject:(Project *)project;

// 删除信息
+ (void)deleteInfo;


@end
