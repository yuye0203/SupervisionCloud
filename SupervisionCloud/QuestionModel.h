//
//	List.h
//
//	Create by 叶婷 葛 on 4/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "KnowledgeModel.h"
#
@interface QuestionModel : KnowledgeModel

//@property (nonatomic, strong) NSString * createTime;
//@property (nonatomic, strong) NSString * idField;
//@property (nonatomic, strong) NSString * image;
//@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;
//
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
