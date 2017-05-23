//
//	PersonItem.m
//
//	Create by 叶婷 葛 on 18/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PersonItem.h"

NSString *const kPersonItemHeadPortrait = @"head_portrait";
NSString *const kPersonItemIdField = @"id";
NSString *const kPersonItemMobile = @"mobile";
NSString *const kPersonItemNickName = @"nick_name";
NSString *const kPersonItemRole = @"role";
NSString *const kPersonItemStatus = @"status";

@interface PersonItem ()
@end
@implementation PersonItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kPersonItemHeadPortrait] isKindOfClass:[NSNull class]]){
		self.headPortrait = dictionary[kPersonItemHeadPortrait];
	}	
	if(![dictionary[kPersonItemIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kPersonItemIdField];
	}	
	if(![dictionary[kPersonItemMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kPersonItemMobile];
	}	
	if(![dictionary[kPersonItemNickName] isKindOfClass:[NSNull class]]){
		self.nickName = dictionary[kPersonItemNickName];
	}	
	if(![dictionary[kPersonItemRole] isKindOfClass:[NSNull class]]){
		self.role = dictionary[kPersonItemRole];
	}	
	if(![dictionary[kPersonItemStatus] isKindOfClass:[NSNull class]]){
		self.status = dictionary[kPersonItemStatus];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.headPortrait != nil){
		dictionary[kPersonItemHeadPortrait] = self.headPortrait;
	}
	if(self.idField != nil){
		dictionary[kPersonItemIdField] = self.idField;
	}
	if(self.mobile != nil){
		dictionary[kPersonItemMobile] = self.mobile;
	}
	if(self.nickName != nil){
		dictionary[kPersonItemNickName] = self.nickName;
	}
	if(self.role != nil){
		dictionary[kPersonItemRole] = self.role;
	}
	if(self.status != nil){
		dictionary[kPersonItemStatus] = self.status;
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
	if(self.headPortrait != nil){
		[aCoder encodeObject:self.headPortrait forKey:kPersonItemHeadPortrait];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kPersonItemIdField];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kPersonItemMobile];
	}
	if(self.nickName != nil){
		[aCoder encodeObject:self.nickName forKey:kPersonItemNickName];
	}
	if(self.role != nil){
		[aCoder encodeObject:self.role forKey:kPersonItemRole];
	}
	if(self.status != nil){
		[aCoder encodeObject:self.status forKey:kPersonItemStatus];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.headPortrait = [aDecoder decodeObjectForKey:kPersonItemHeadPortrait];
	self.idField = [aDecoder decodeObjectForKey:kPersonItemIdField];
	self.mobile = [aDecoder decodeObjectForKey:kPersonItemMobile];
	self.nickName = [aDecoder decodeObjectForKey:kPersonItemNickName];
	self.role = [aDecoder decodeObjectForKey:kPersonItemRole];
	self.status = [aDecoder decodeObjectForKey:kPersonItemStatus];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	PersonItem *copy = [PersonItem new];

	copy.headPortrait = [self.headPortrait copy];
	copy.idField = [self.idField copy];
	copy.mobile = [self.mobile copy];
	copy.nickName = [self.nickName copy];
	copy.role = [self.role copy];
	copy.status = [self.status copy];

	return copy;
}
+(NSDictionary *)replacedKeyFromPropertyName{
    

    return @{
             @"idField":kPersonItemIdField,
             @"nickName":kPersonItemNickName,
             @"head_portrait":kPersonItemHeadPortrait
             };
    
}
@end
