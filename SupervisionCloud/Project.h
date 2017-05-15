//
//	Project.h
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface Project : NSObject

@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * projectName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
