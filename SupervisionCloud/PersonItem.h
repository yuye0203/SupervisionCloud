//
//	PersonItem.h
//
//	Create by 叶婷 葛 on 18/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PersonItem : NSObject

@property (nonatomic, strong) NSString * headPortrait;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * mobile;
@property (nonatomic, strong) NSString * nickName;
@property (nonatomic, strong) NSString * role;
@property (nonatomic, strong) NSString * status;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end