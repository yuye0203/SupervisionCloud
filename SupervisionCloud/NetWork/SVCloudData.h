//
//  SVCloudData.h
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SVCloudData : NSObject

/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;


/**
 *  对象方法实现文件数据模型的封装
 *
 *  @param data     文件数据
 *  @param name     参数名
 *  @param fileName 文件名
 *  @param mimeType 文件类型
 *
 *  @return FRFormData数据模型
 */
- (instancetype)initWithFileData:(NSData *)data
                            name:(NSString *)name
                        fileName:(NSString *)fileName
                        mimeType:(NSString *)mimeType;

/**
 *  类方法实现文件数据模型的封装
 *
 *  @param data     文件数据
 *  @param name     参数名
 *  @param fileName 文件名
 *  @param mimeType 文件类型
 *
 *  @return FRFormData数据模型
 */
+ (instancetype)formDataWithFileData:(NSData *)data
                                name:(NSString *)name
                            fileName:(NSString *)fileName
                            mimeType:(NSString *)mimeType;

@end

