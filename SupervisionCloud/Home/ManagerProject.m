//
//  ManagerProject.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/10.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "ManagerProject.h"
#import "MJExtension.h"

#define kProjectKey @"KMPROJECT"

@implementation ManagerProject
// 是否获取project
+ (BOOL)isGetProject{
    Project *uDefault = [ManagerProject getProject];
    return uDefault ? YES : NO;

}


+(Project *)getProject{
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *infoDic = [uDefault objectForKey:kProjectKey];
    Project *project = [Project mj_objectWithKeyValues:infoDic];
    return project;

}

+ (void)saveProject:(Project *)project{
    
    NSMutableDictionary *infoDic = [Project mj_keyValues];
    if (infoDic.allKeys.count > 0) {
        NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
        [uDefault setObject:infoDic forKey:kProjectKey];
        [uDefault synchronize];
    }
}

+ (void)deleteInfo {
    NSUserDefaults *uDefault = [NSUserDefaults standardUserDefaults];
    [uDefault removeObjectForKey:kProjectKey];
}



@end
