//
//  BaseModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

@synthesize body;
@synthesize cmd;
@synthesize resultCode;
@synthesize resultMessage;

NSString *const kBaseClassBody = @"body";
NSString *const kBaseClassCmd = @"cmd";
NSString *const kBaseClassResultCode = @"resultCode";
NSString *const kBaseClassResultMessage = @"resultMessage";


+(id)creatWithDic:(NSDictionary*)dic
{
    BaseModel *entity =[BaseModel new];
    if (entity) {
        entity.resultCode = [[NSString getStringValue:[dic objectForKey:kBaseClassResultCode]] integerValue];
        entity.cmd  = [NSString getStringValue:[dic objectForKey:kBaseClassCmd]];
        entity.resultMessage  = [NSString getStringValue:[dic objectForKey:kBaseClassResultMessage]];

        entity.body = [dic objectForKey:kBaseClassBody];
    }
    return entity;
}

@end
