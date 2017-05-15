//
//	Banner.h
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Contract.h"
#import "Dynamic.h"

@interface Banner : NSObject

@property (nonatomic, strong) Contract * contract;
@property (nonatomic, strong) Dynamic * dynamic;
@property (nonatomic, strong) NSString * plan;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
