//
//	StaffItem.h
//
//	Create by 叶婷 葛 on 11/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface StaffItem : NSObject

@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * removeTime;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString * userName;
@property (nonatomic, strong) NSString * userRole;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end