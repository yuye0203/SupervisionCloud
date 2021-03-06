//
//	PersonItem.h
//
//	Create by 叶婷 葛 on 25/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PersonItem : NSObject

@property (nonatomic, strong) NSString * dynamic;
@property (nonatomic, strong) NSString * headPortrait;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * intention;
@property (nonatomic, strong) NSString * jobNumber;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * nickname;
@property (nonatomic, strong) NSString * projectName;
@property (nonatomic, strong) NSString * removeTime;
@property (nonatomic, strong) NSString * role;
@property (nonatomic, strong) NSString * sex;
@property (nonatomic, strong) NSString * status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end