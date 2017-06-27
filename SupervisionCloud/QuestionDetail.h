//
//	QuestionDetail.h
//
//	Create by 叶婷 葛 on 2/6/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface QuestionDetail : NSObject

@property (nonatomic, assign) NSInteger answerNum;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSArray * imgUrl;
@property (nonatomic, assign) NSInteger praiseNum;
@property (nonatomic, strong) NSString * subtitle;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end