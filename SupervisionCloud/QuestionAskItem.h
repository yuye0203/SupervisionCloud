//
//	QuestionAskItem.h
//
//	Create by 叶婷 葛 on 2/6/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface QuestionAskItem : NSObject

@property (nonatomic, strong) NSString * answer;
@property (nonatomic, strong) NSString * createdBy;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger isPraise;
@property (nonatomic, strong) NSString * time;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end