//
//	QuestionAskItem.m
//
//	Create by 叶婷 葛 on 2/6/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QuestionAskItem.h"

NSString *const kQuestionAskItemAnswer = @"answer";
NSString *const kQuestionAskItemCreatedBy = @"created_by";
NSString *const kQuestionAskItemIdField = @"id";
NSString *const kQuestionAskItemImage = @"image";
NSString *const kQuestionAskItemIsPraise = @"is_praise";
NSString *const kQuestionAskItemTime = @"time";

@interface QuestionAskItem ()
@end
@implementation QuestionAskItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kQuestionAskItemAnswer] isKindOfClass:[NSNull class]]){
		self.answer = dictionary[kQuestionAskItemAnswer];
	}	
	if(![dictionary[kQuestionAskItemCreatedBy] isKindOfClass:[NSNull class]]){
		self.createdBy = dictionary[kQuestionAskItemCreatedBy];
	}	
	if(![dictionary[kQuestionAskItemIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kQuestionAskItemIdField];
	}	
	if(![dictionary[kQuestionAskItemImage] isKindOfClass:[NSNull class]]){
		self.image = dictionary[kQuestionAskItemImage];
	}	
	if(![dictionary[kQuestionAskItemIsPraise] isKindOfClass:[NSNull class]]){
		self.isPraise = [dictionary[kQuestionAskItemIsPraise] integerValue];
	}

	if(![dictionary[kQuestionAskItemTime] isKindOfClass:[NSNull class]]){
		self.time = dictionary[kQuestionAskItemTime];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.answer != nil){
		dictionary[kQuestionAskItemAnswer] = self.answer;
	}
	if(self.createdBy != nil){
		dictionary[kQuestionAskItemCreatedBy] = self.createdBy;
	}
	if(self.idField != nil){
		dictionary[kQuestionAskItemIdField] = self.idField;
	}
	if(self.image != nil){
		dictionary[kQuestionAskItemImage] = self.image;
	}
	dictionary[kQuestionAskItemIsPraise] = @(self.isPraise);
	if(self.time != nil){
		dictionary[kQuestionAskItemTime] = self.time;
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
	if(self.answer != nil){
		[aCoder encodeObject:self.answer forKey:kQuestionAskItemAnswer];
	}
	if(self.createdBy != nil){
		[aCoder encodeObject:self.createdBy forKey:kQuestionAskItemCreatedBy];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kQuestionAskItemIdField];
	}
	if(self.image != nil){
		[aCoder encodeObject:self.image forKey:kQuestionAskItemImage];
	}
	[aCoder encodeObject:@(self.isPraise) forKey:kQuestionAskItemIsPraise];	if(self.time != nil){
		[aCoder encodeObject:self.time forKey:kQuestionAskItemTime];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.answer = [aDecoder decodeObjectForKey:kQuestionAskItemAnswer];
	self.createdBy = [aDecoder decodeObjectForKey:kQuestionAskItemCreatedBy];
	self.idField = [aDecoder decodeObjectForKey:kQuestionAskItemIdField];
	self.image = [aDecoder decodeObjectForKey:kQuestionAskItemImage];
	self.isPraise = [[aDecoder decodeObjectForKey:kQuestionAskItemIsPraise] integerValue];
	self.time = [aDecoder decodeObjectForKey:kQuestionAskItemTime];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	QuestionAskItem *copy = [QuestionAskItem new];

	copy.answer = [self.answer copy];
	copy.createdBy = [self.createdBy copy];
	copy.idField = [self.idField copy];
	copy.image = [self.image copy];
	copy.isPraise = self.isPraise;
	copy.time = [self.time copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    
    return @{@"createdBy":kQuestionAskItemCreatedBy,
             @"isPraise":kQuestionAskItemIsPraise
            };
    
}

@end
