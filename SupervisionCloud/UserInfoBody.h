//
//	UserInfoBody.h
//
//	Create by 叶婷 葛 on 8/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface UserInfoBody : NSObject

@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * headPortrait;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, assign) NSInteger openNotice;
@property (nonatomic, strong) NSString * role;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end