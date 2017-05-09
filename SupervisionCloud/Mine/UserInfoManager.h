//
//  UserInfoManager.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/8.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoBody.h"


@interface UserInfoManager : NSObject

// 是否登录
+ (BOOL)isLogin;

// 保存信息
+ (void)saveInfo:(UserInfoBody *)info;

// 获取信息
+ (UserInfoBody *)getInfo;

// 删除信息
+ (void)deleteInfo;



@end
