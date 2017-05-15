//
//	FunctionItem.h
//
//	Create by 叶婷 葛 on 11/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface FunctionItem : NSObject

@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger notice;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end