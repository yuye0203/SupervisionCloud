//
//	List.m
//
//	Create by 叶婷 葛 on 4/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "KnowledgeModel.h"

NSString *const kListImage = @"image";
NSString *const kListType = @"type";
NSString *const kKnowledgeModelPraiseNum = @"praise_num";
NSString *const kKnowledgeModelDesc = @"desc";

@interface KnowledgeModel ()
@end




@implementation KnowledgeModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kListImage] isKindOfClass:[NSNull class]]){
		self.imgUrl = dictionary[kListImage];
	}	

    if(![dictionary[kListType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kListType];
	}
    if(![dictionary[kKnowledgeModelPraiseNum] isKindOfClass:[NSNull class]]){
        self.praiseNum = [dictionary[kKnowledgeModelPraiseNum] integerValue];
    }
    if(![dictionary[kKnowledgeModelDesc] isKindOfClass:[NSNull class]]){
        self.desc = dictionary[kKnowledgeModelDesc];
    }	


	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [[super toDictionary] mutableCopy];
//	if(self.createTime != nil){
//		dictionary[kListCreateTime] = self.createTime;
//	}
    if(self.desc != nil){
        dictionary[kKnowledgeModelDesc] = self.desc;
    }
	if(self.imgUrl != nil){
		dictionary[kListImage] = self.imgUrl;
	}
//	if(self.title != nil){
//		dictionary[kListTitle] = self.title;
//	}
	if(self.type != nil){
		dictionary[kListType] = self.type;
	}
    dictionary[kKnowledgeModelPraiseNum] = @(self.praiseNum);

	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    if(self.desc != nil){
        [aCoder encodeObject:self.desc forKey:kKnowledgeModelDesc];
    }

    if(self.imgUrl != nil){
		[aCoder encodeObject:self.imgUrl forKey:kListImage];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:kListType];
	}
    
    [aCoder encodeObject:@(self.praiseNum) forKey:kKnowledgeModelPraiseNum];

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.imgUrl = [aDecoder decodeObjectForKey:kListImage];
	self.type = [aDecoder decodeObjectForKey:kListType];
    self.praiseNum = [[aDecoder decodeObjectForKey:kKnowledgeModelPraiseNum] integerValue];
    self.desc = [aDecoder decodeObjectForKey:kKnowledgeModelDesc];


	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	KnowledgeModel *copy = [KnowledgeModel new];

	copy.createTime = [self.createTime copy];
	copy.idField = self.idField;
	copy.imgUrl = [self.imgUrl copy];
	copy.title = [self.title copy];
	copy.type = [self.type copy];
    copy.praiseNum = self.praiseNum;
    copy.desc = [self.desc copy];

	return copy;
}


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"answerNum":@"answer_num",
             @"createTime":@"create_time",
             @"idField":@"id",
             @"praiseNum":kKnowledgeModelPraiseNum};
    
}

@end
