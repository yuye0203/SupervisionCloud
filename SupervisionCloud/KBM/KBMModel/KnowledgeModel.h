//
//	List.h
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface KnowledgeModel : NSObject

@property (nonatomic, assign) NSInteger answerNum;
@property (nonatomic, strong) NSString * author;
@property (nonatomic, strong) NSString * createTime;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * imgUrl;
@property (nonatomic, strong) NSString * subtitle;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
