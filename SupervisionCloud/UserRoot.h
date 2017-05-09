//
//	UserInfoUserRoot.h
//
//	Create by 叶婷 葛 on 8/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "UserInfoBody.h"

@interface UserInfoUserRoot : NSObject

@property (nonatomic, strong) UserInfoBody * body;
@property (nonatomic, strong) NSString * cmd;
@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, strong) NSString * resultMessage;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end