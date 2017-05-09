//
//	List.m
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import "KnowledgeModel.h"

NSString *const kListAnswerNum = @"answer_num";
NSString *const kListAuthor = @"author";
NSString *const kListCreateTime = @"create_time";
NSString *const kListIdField = @"id";
NSString *const kListImgUrl = @"img_url";
NSString *const kListSubtitle = @"subtitle";
NSString *const kListTitle = @"title";

@interface KnowledgeModel ()
@end
@implementation KnowledgeModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kListAnswerNum] isKindOfClass:[NSNull class]]){
		self.answerNum = [dictionary[kListAnswerNum] integerValue];
	}

	if(![dictionary[kListAuthor] isKindOfClass:[NSNull class]]){
		self.author = dictionary[kListAuthor];
	}	
	if(![dictionary[kListCreateTime] isKindOfClass:[NSNull class]]){
		self.createTime = dictionary[kListCreateTime];
	}	
	if(![dictionary[kListIdField] isKindOfClass:[NSNull class]]){
        self.idField = dictionary[kListIdField] ;
	}	
	if(![dictionary[kListImgUrl] isKindOfClass:[NSNull class]]){
		self.imgUrl = dictionary[kListImgUrl];
	}	
	if(![dictionary[kListSubtitle] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[kListSubtitle];
	}	
	if(![dictionary[kListTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kListTitle];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kListAnswerNum] = @(self.answerNum);

	if(self.author != nil){
		dictionary[kListAuthor] = self.author;
	}
	if(self.createTime != nil){
		dictionary[kListCreateTime] = self.createTime;
	}
	if(self.idField != nil){
		dictionary[kListIdField] = self.idField;
	}
	if(self.imgUrl != nil){
		dictionary[kListImgUrl] = self.imgUrl;
	}
	if(self.subtitle != nil){
		dictionary[kListSubtitle] = self.subtitle;
	}
	if(self.title != nil){
		dictionary[kListTitle] = self.title;
	}
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
	[aCoder encodeObject:@(self.answerNum) forKey:kListAnswerNum];

    if(self.author != nil){
		[aCoder encodeObject:self.author forKey:kListAuthor];
	}
	if(self.createTime != nil){
		[aCoder encodeObject:self.createTime forKey:kListCreateTime];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kListIdField];
	}
	if(self.imgUrl != nil){
		[aCoder encodeObject:self.imgUrl forKey:kListImgUrl];
	}
	if(self.subtitle != nil){
		[aCoder encodeObject:self.subtitle forKey:kListSubtitle];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kListTitle];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.answerNum = [[aDecoder decodeObjectForKey:kListAnswerNum] integerValue];
	self.author = [aDecoder decodeObjectForKey:kListAuthor];
	self.createTime = [aDecoder decodeObjectForKey:kListCreateTime];
	self.idField = [aDecoder decodeObjectForKey:kListIdField];
	self.imgUrl = [aDecoder decodeObjectForKey:kListImgUrl];
	self.subtitle = [aDecoder decodeObjectForKey:kListSubtitle];
	self.title = [aDecoder decodeObjectForKey:kListTitle];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	KnowledgeModel *copy = [KnowledgeModel new];

	copy.answerNum = self.answerNum;
	copy.author = [self.author copy];
	copy.createTime = [self.createTime copy];
	copy.idField = [self.idField copy];
	copy.imgUrl = [self.imgUrl copy];
	copy.subtitle = [self.subtitle copy];
	copy.title = [self.title copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"answerNum":kListAnswerNum,
             @"author":kListAuthor,
             @"createTime":kListCreateTime,
             @"idField":kListIdField,
             @"imgUrl":kListImgUrl,
             @"subtitle":kListSubtitle,
             @"title":kListTitle};
    
}
@end
