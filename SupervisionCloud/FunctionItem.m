//
//	FunctionItem.m
//
//	Create by 叶婷 葛 on 11/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "FunctionItem.h"

NSString *const kFunctionItemIdField = @"id";
NSString *const kFunctionItemImg = @"img";
NSString *const kFunctionItemName = @"name";
NSString *const kFunctionItemNotice = @"notice";

@interface FunctionItem ()
@end
@implementation FunctionItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kFunctionItemIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kFunctionItemIdField] integerValue];
	}

	if(![dictionary[kFunctionItemImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kFunctionItemImg];
	}	
	if(![dictionary[kFunctionItemName] isKindOfClass:[NSNull class]]){
		self.name = dictionary[kFunctionItemName];
	}	
	if(![dictionary[kFunctionItemNotice] isKindOfClass:[NSNull class]]){
		self.notice = [dictionary[kFunctionItemNotice] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kFunctionItemIdField] = @(self.idField);
	if(self.img != nil){
		dictionary[kFunctionItemImg] = self.img;
	}
	if(self.name != nil){
		dictionary[kFunctionItemName] = self.name;
	}
	dictionary[kFunctionItemNotice] = @(self.notice);
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
	[aCoder encodeObject:@(self.idField) forKey:kFunctionItemIdField];	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:kFunctionItemImg];
	}
	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:kFunctionItemName];
	}
	[aCoder encodeObject:@(self.notice) forKey:kFunctionItemNotice];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [[aDecoder decodeObjectForKey:kFunctionItemIdField] integerValue];
	self.img = [aDecoder decodeObjectForKey:kFunctionItemImg];
	self.name = [aDecoder decodeObjectForKey:kFunctionItemName];
	self.notice = [[aDecoder decodeObjectForKey:kFunctionItemNotice] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	FunctionItem *copy = [FunctionItem new];

	copy.idField = self.idField;
	copy.img = [self.img copy];
	copy.name = [self.name copy];
	copy.notice = self.notice;

	return copy;
}
@end