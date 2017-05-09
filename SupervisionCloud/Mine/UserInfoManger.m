//
//  UserInfoManger.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//
#define kUserInfoKey @"KMUSERKEY"


#import "UserInfoManger.h"
#import "MJExtension.h"

@implementation UserInfoManger
+ (BOOL)isLogin {
    UserInfoBody *uDefault = [UserInfoManger getInfo];
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
    UserInfoBody *userInfo = [UserInfoBody mj_objectWithKeyValues:infoDic];
    return userInfo;
}

+ (void)deleteInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    [uDefault removeObjectForKey:kUserInfoKey];
}


@end
