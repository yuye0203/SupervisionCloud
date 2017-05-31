//
//	DocumentsItem.h
//
//	Create by 叶婷 葛 on 25/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DocumentsItem : NSObject

@property (nonatomic, strong) NSString * img;
@property (nonatomic, strong) NSString * needCheckNum;
@property (nonatomic, strong) NSString * num;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end