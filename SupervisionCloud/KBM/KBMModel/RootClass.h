//
//	RootClass.h
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ListBody.h"

@interface RootClass : NSObject

@property (nonatomic, strong) ListBody * body;
@property (nonatomic, strong) NSString * cmd;
@property (nonatomic, assign) NSInteger resultCode;
@property (nonatomic, strong) NSString * resultMessage;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
