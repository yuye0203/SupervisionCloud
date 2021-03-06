//
//	List.h
//
//	Create by 叶婷 葛 on 4/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "QuestionModel.h"

@interface KnowledgeModel : QuestionModel

@property (nonatomic, strong) NSString * type;
@property (nonatomic, assign) NSInteger praiseNum;
@property (nonatomic, strong) NSString * desc;


//
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
