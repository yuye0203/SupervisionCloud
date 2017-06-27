//
//	QuestionDetail.m
//
//	Create by 叶婷 葛 on 2/6/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QuestionDetail.h"

NSString *const kQuestionDetailAnswerNum = @"answer_num";
NSString *const kQuestionDetailDesc = @"desc";
NSString *const kQuestionDetailIdField = @"id";
NSString *const kQuestionDetailImgUrl = @"img_url";
NSString *const kQuestionDetailPraiseNum = @"praise_num";
NSString *const kQuestionDetailSubtitle = @"subtitle";
NSString *const kQuestionDetailTitle = @"title";
NSString *const kQuestionDetailType = @"type";

@interface QuestionDetail ()
@end
@implementation QuestionDetail




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kQuestionDetailAnswerNum] isKindOfClass:[NSNull class]]){
		self.answerNum = [dictionary[kQuestionDetailAnswerNum] integerValue];
	}

	if(![dictionary[kQuestionDetailDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kQuestionDetailDesc];
	}	
	if(![dictionary[kQuestionDetailIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kQuestionDetailIdField];
	}	
	if(![dictionary[kQuestionDetailImgUrl] isKindOfClass:[NSNull class]]){
		self.imgUrl = dictionary[kQuestionDetailImgUrl];
	}	
	if(![dictionary[kQuestionDetailPraiseNum] isKindOfClass:[NSNull class]]){
		self.praiseNum = [dictionary[kQuestionDetailPraiseNum] integerValue];
	}

	if(![dictionary[kQuestionDetailSubtitle] isKindOfClass:[NSNull class]]){
		self.subtitle = dictionary[kQuestionDetailSubtitle];
	}	
	if(![dictionary[kQuestionDetailTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kQuestionDetailTitle];
	}	
	if(![dictionary[kQuestionDetailType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kQuestionDetailType];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kQuestionDetailAnswerNum] = @(self.answerNum);
	if(self.desc != nil){
		dictionary[kQuestionDetailDesc] = self.desc;
	}
	if(self.idField != nil){
		dictionary[kQuestionDetailIdField] = self.idField;
	}
	if(self.imgUrl != nil){
		dictionary[kQuestionDetailImgUrl] = self.imgUrl;
	}
	dictionary[kQuestionDetailPraiseNum] = @(self.praiseNum);
	if(self.subtitle != nil){
		dictionary[kQuestionDetailSubtitle] = self.subtitle;
	}
	if(self.title != nil){
		dictionary[kQuestionDetailTitle] = self.title;
	}
	if(self.type != nil){
		dictionary[kQuestionDetailType] = self.type;
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
	[aCoder encodeObject:@(self.answerNum) forKey:kQuestionDetailAnswerNum];	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kQuestionDetailDesc];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kQuestionDetailIdField];
	}
	if(self.imgUrl != nil){
		[aCoder encodeObject:self.imgUrl forKey:kQuestionDetailImgUrl];
	}
	[aCoder encodeObject:@(self.praiseNum) forKey:kQuestionDetailPraiseNum];	if(self.subtitle != nil){
		[aCoder encodeObject:self.subtitle forKey:kQuestionDetailSubtitle];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kQuestionDetailTitle];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:kQuestionDetailType];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.answerNum = [[aDecoder decodeObjectForKey:kQuestionDetailAnswerNum] integerValue];
	self.desc = [aDecoder decodeObjectForKey:kQuestionDetailDesc];
	self.idField = [aDecoder decodeObjectForKey:kQuestionDetailIdField];
	self.imgUrl = [aDecoder decodeObjectForKey:kQuestionDetailImgUrl];
	self.praiseNum = [[aDecoder decodeObjectForKey:kQuestionDetailPraiseNum] integerValue];
	self.subtitle = [aDecoder decodeObjectForKey:kQuestionDetailSubtitle];
	self.title = [aDecoder decodeObjectForKey:kQuestionDetailTitle];
	self.type = [aDecoder decodeObjectForKey:kQuestionDetailType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	QuestionDetail *copy = [QuestionDetail new];

	copy.answerNum = self.answerNum;
	copy.desc = [self.desc copy];
	copy.idField = [self.idField copy];
	copy.imgUrl = [self.imgUrl copy];
	copy.praiseNum = self.praiseNum;
	copy.subtitle = [self.subtitle copy];
	copy.title = [self.title copy];
	copy.type = [self.type copy];

	return copy;
}
+(NSDictionary *)replacedKeyFromPropertyName{
    
    return @{@"imgUrl":kQuestionDetailImgUrl,
             @"answerNum":@"answer_num",
             @"createTime":@"create_time",
             @"idField":@"id",
             @"praiseNum":kQuestionDetailPraiseNum};
    
}

@end
