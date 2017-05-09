//
//	ListBody
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "KnowledgeModel.h"

@interface ListBody : NSObject

@property (nonatomic, strong) NSArray * hot;
@property (nonatomic, strong) NSArray * question;
@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger pages;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
