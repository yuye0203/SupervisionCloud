//
//  UserInfoManager.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/8.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "UserInfoManager.h"
#import "MJExtension.h"

#define kUserInfoKey @"KMUSERKEY"

@implementation UserInfoManager

+ (BOOL)isLogin {
    UserInfoBody *uDefault = [UserInfoManager getInfo];
    return uDefault ? YES : NO;
}

+ (void)saveInfo:(UserInfoBody *)info {
    NSMutableDictionary *infoDic = [info mj_keyValues];
    if (infoDic.allKeys.count > 0) {
        NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
        [uDefault setObject:infoDic forKey:kUserInfoKey];
        [uDefault synchronize];
    }
}

+ (UserInfoBody *)getInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *infoDic = [uDefault objectForKey:kUserInfoKey];
    UserInfoBody *km_userInfo = [UserInfoBody mj_objectWithKeyValues:infoDic];
    return km_userInfo;
}

+ (void)deleteInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    [uDefault removeObjectForKey:kUserInfoKey];
}


@end

