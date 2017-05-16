//
//	List.m
//
//	Create by 叶婷 葛 on 4/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "KnowledgeModel.h"

NSString *const kListImage = @"image";
NSString *const kListType = @"type";

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
//	if(![dictionary[kListTitle] isKindOfClass:[NSNull class]]){
//		self.title = dictionary[kListTitle];
//	}	
	if(![dictionary[kListType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kListType];
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
//	if(self.idField != nil){
//		dictionary[kListIdField] = self.idField;
//	}
	if(self.imgUrl != nil){
		dictionary[kListImage] = self.imgUrl;
	}
//	if(self.title != nil){
//		dictionary[kListTitle] = self.title;
//	}
	if(self.type != nil){
		dictionary[kListType] = self.type;
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
    [super encodeWithCoder:aCoder];
//	if(self.createTime != nil){
//		[aCoder encodeObject:self.createTime forKey:kListCreateTime];
//	}
//	if(self.idField != nil){
//		[aCoder encodeObject:self.idField forKey:kListIdField];
//	}
	if(self.imgUrl != nil){
		[aCoder encodeObject:self.imgUrl forKey:kListImage];
	}
//	if(self.title != nil){
//		[aCoder encodeObject:self.title forKey:kListTitle];
//	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:kListType];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
//	self.createTime = [aDecoder decodeObjectForKey:kListCreateTime];
//	self.idField = [aDecoder decodeObjectForKey:kListIdField];
	self.imgUrl = [aDecoder decodeObjectForKey:kListImage];
//	self.title = [aDecoder decodeObjectForKey:kListTitle];
	self.type = [aDecoder decodeObjectForKey:kListType];
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

	return copy;
}
@end
