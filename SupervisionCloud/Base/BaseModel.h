//
//  BaseModel.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SVCloudNetwork.h"
#import "NSCategory.h"
/*
 1 : OK
 300：参数错误
 
 400: 错误请求。这通常是用户侧的错误，比如无效的JSON数据，无效动作参数，等等。
 401: 认证失败。
 403: 认证用户不允许访问该API终端。
 404: 请求资源不存在。
 
 422: 数据验证失败（比如对于一个 POST 请求）。请检查应答body中的错误详细描述。
 429: 请求过多。请求因超出速率限制而被拒绝。
 500: 服务器内部错误。这通常是服务器程序内部错误。
 */

typedef NS_ENUM(NSInteger, ResultCode) {
    ResultCodeSuccess          = 1,
    ResultCodeParameterErr     = 300,
    ResultCodeRequestErr       = 400,
    ResultCodeCertificationErr = 401,
    ResultCodeNOPermissionErr  = 403,
    ResultCodeNotFoundErr      = 404,
    ResultCodeDataErr          = 422,
    ResultFrequentErr          = 429,
    ResultServerErr            = 500,
    
    
};

@interface BaseModel : NSObject

@property (nonatomic,strong) id        body;
@property (nonatomic, strong) NSString * cmd;
@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, strong) NSString * resultMessage;

+(id)creatWithDic:(NSDictionary*)dic;
@end
