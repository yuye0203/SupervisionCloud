//
//  SVCloudData.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "SVCloudData.h"

@implementation SVCloudData

- (instancetype)initWithFileData:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                        mimeType:(NSString *)mimeType
{
    if (self = [super init]) {
        self.data = data;
        self.name = name;
        self.fileName = fileName;
        self.mimeType = mimeType;
    }
    return self;
}

+ (instancetype)formDataWithFileData:(NSData *)data
                                name:(NSString *)name
                            fileName:(NSString *)fileName
                            mimeType:(NSString *)mimeType
{
    return [[self alloc]initWithFileData:data name:name fileName:fileName mimeType:mimeType];
}

@end
