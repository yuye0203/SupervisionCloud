//
//	QuestionType.m
//
//	Create by 叶婷 葛 on 11/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "QuestionType.h"

NSString *const kQuestionTypeIdField = @"id";
NSString *const kQuestionTypeName = @"name";

@interface QuestionType ()
@end
@implementation QuestionType




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kQuestionTypeIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kQuestionTypeIdField] integerValue];
	}

	if(![dictionary[kQuestionTypeName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kQuestionTypeName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kQuestionTypeIdField] = @(self.idField);
	if(self.name != nil){
		dictionary[kQuestionTypeName] = self.name;
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
	[aCoder encodeObject:@(self.idField) forKey:kQuestionTypeIdField];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kQuestionTypeName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [[aDecoder decodeObjectForKey:kQuestionTypeIdField] integerValue];
	self.name = [aDecoder decodeObjectForKey:kQuestionTypeName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	QuestionType *copy = [QuestionType new];

	copy.idField = self.idField;
	copy.name = [self.name copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"idField":kQuestionTypeIdField,
            };
    
}
@end
