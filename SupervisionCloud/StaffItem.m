//
//	StaffItem.m
//
//	Create by 叶婷 葛 on 11/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "StaffItem.h"

NSString *const kStaffItemIdField = @"id";
NSString *const kStaffItemRemoveTime = @"remove_time";
NSString *const kStaffItemUserId = @"user_id";
NSString *const kStaffItemUserName = @"user_name";
NSString *const kStaffItemUserRole = @"user_role";

@interface StaffItem ()
@end
@implementation StaffItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kStaffItemIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kStaffItemIdField] integerValue];
	}

	if(![dictionary[kStaffItemRemoveTime] isKindOfClass:[NSNull class]]){
		self.removeTime = dictionary[kStaffItemRemoveTime];
	}	
	if(![dictionary[kStaffItemUserId] isKindOfClass:[NSNull class]]){
		self.userId = [dictionary[kStaffItemUserId] integerValue];
	}

	if(![dictionary[kStaffItemUserName] isKindOfClass:[NSNull class]]){
		self.userName = dictionary[kStaffItemUserName];
	}	
	if(![dictionary[kStaffItemUserRole] isKindOfClass:[NSNull class]]){
		self.userRole = dictionary[kStaffItemUserRole];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kStaffItemIdField] = @(self.idField);
	if(self.removeTime != nil){
		dictionary[kStaffItemRemoveTime] = self.removeTime;
	}
	dictionary[kStaffItemUserId] = @(self.userId);
	if(self.userName != nil){
		dictionary[kStaffItemUserName] = self.userName;
	}
	if(self.userRole != nil){
		dictionary[kStaffItemUserRole] = self.userRole;
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
	[aCoder encodeObject:@(self.idField) forKey:kStaffItemIdField];	if(self.removeTime != nil){
		[aCoder encodeObject:self.removeTime forKey:kStaffItemRemoveTime];
	}
	[aCoder encodeObject:@(self.userId) forKey:kStaffItemUserId];	if(self.userName != nil){
		[aCoder encodeObject:self.userName forKey:kStaffItemUserName];
	}
	if(self.userRole != nil){
		[aCoder encodeObject:self.userRole forKey:kStaffItemUserRole];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [[aDecoder decodeObjectForKey:kStaffItemIdField] integerValue];
	self.removeTime = [aDecoder decodeObjectForKey:kStaffItemRemoveTime];
	self.userId = [[aDecoder decodeObjectForKey:kStaffItemUserId] integerValue];
	self.userName = [aDecoder decodeObjectForKey:kStaffItemUserName];
	self.userRole = [aDecoder decodeObjectForKey:kStaffItemUserRole];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	StaffItem *copy = [StaffItem new];

	copy.idField = self.idField;
	copy.removeTime = [self.removeTime copy];
	copy.userId = self.userId;
	copy.userName = [self.userName copy];
	copy.userRole = [self.userRole copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    
    return @{@"idField":kStaffItemIdField,
             @"remove_time":kStaffItemRemoveTime,
             @"user_name":kStaffItemUserName,
             @"user_role":kStaffItemUserRole,
             @"user_id":kStaffItemUserId};
}

@end
