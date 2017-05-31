//
//  BaseViewModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMVVMKit.h"
#import "SVCloudNetwork.h"
#import "MJExtension.h"

typedef void(^GotoLogin)();

@interface BaseViewModel : NSObject

- (void)postWithUrl:(NSString *)url body:(NSData *)body showLoading:(BOOL)show success:(void(^)(NSDictionary *response))success failure:(void(^)(NSError *error))failure;

-(NSDictionary *)parametersWithDic:(NSMutableDictionary *)mdic;
@property (nonatomic, copy) GotoLogin  goToLogin;

@end
