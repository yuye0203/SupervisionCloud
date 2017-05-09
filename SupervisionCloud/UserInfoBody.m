//
//	UserInfoBody.m
//
//	Create by 叶婷 葛 on 8/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UserInfoBody.h"

NSString *const kUserInfoBodyEmail = @"email";
NSString *const kUserInfoBodyHeadPortrait = @"head_portrait";
NSString *const kUserInfoBodyIdField = @"id";
NSString *const kUserInfoBodyMobile = @"mobile";
NSString *const kUserInfoBodyNickname = @"nickname";
NSString *const kUserInfoBodyOpenNotice = @"open_notice";
NSString *const kUserInfoBodyRole = @"role";

@interface UserInfoBody ()
@end
@implementation UserInfoBody




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserInfoBodyEmail] isKindOfClass:[NSNull class]]){
		self.email = dictionary[kUserInfoBodyEmail];
	}	
	if(![dictionary[kUserInfoBodyHeadPortrait] isKindOfClass:[NSNull class]]){
		self.headPortrait = dictionary[kUserInfoBodyHeadPortrait];
	}	
	if(![dictionary[kUserInfoBodyIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kUserInfoBodyIdField];
	}	
	if(![dictionary[kUserInfoBodyMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kUserInfoBodyMobile];
	}	
	if(![dictionary[kUserInfoBodyNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kUserInfoBodyNickname];
	}	
	if(![dictionary[kUserInfoBodyOpenNotice] isKindOfClass:[NSNull class]]){
		self.openNotice = [dictionary[kUserInfoBodyOpenNotice] integerValue];
	}

	if(![dictionary[kUserInfoBodyRole] isKindOfClass:[NSNull class]]){
		self.role = dictionary[kUserInfoBodyRole];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.email != nil){
		dictionary[kUserInfoBodyEmail] = self.email;
	}
	if(self.headPortrait != nil){
		dictionary[kUserInfoBodyHeadPortrait] = self.headPortrait;
	}
	if(self.idField != nil){
		dictionary[kUserInfoBodyIdField] = self.idField;
	}
	if(self.mobile != nil){
		dictionary[kUserInfoBodyMobile] = self.mobile;
	}
	if(self.nickname != nil){
		dictionary[kUserInfoBodyNickname] = self.nickname;
	}
	dictionary[kUserInfoBodyOpenNotice] = @(self.openNotice);
	if(self.role != nil){
		dictionary[kUserInfoBodyRole] = self.role;
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
	if(self.email != nil){
		[aCoder encodeObject:self.email forKey:kUserInfoBodyEmail];
	}
	if(self.headPortrait != nil){
		[aCoder encodeObject:self.headPortrait forKey:kUserInfoBodyHeadPortrait];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kUserInfoBodyIdField];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kUserInfoBodyMobile];
	}
	if(self.nickname != nil){
		[aCoder encodeObject:self.nickname forKey:kUserInfoBodyNickname];
	}
	[aCoder encodeObject:@(self.openNotice) forKey:kUserInfoBodyOpenNotice];	if(self.role != nil){
		[aCoder encodeObject:self.role forKey:kUserInfoBodyRole];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.email = [aDecoder decodeObjectForKey:kUserInfoBodyEmail];
	self.headPortrait = [aDecoder decodeObjectForKey:kUserInfoBodyHeadPortrait];
	self.idField = [aDecoder decodeObjectForKey:kUserInfoBodyIdField];
	self.mobile = [aDecoder decodeObjectForKey:kUserInfoBodyMobile];
	self.nickname = [aDecoder decodeObjectForKey:kUserInfoBodyNickname];
	self.openNotice = [[aDecoder decodeObjectForKey:kUserInfoBodyOpenNotice] integerValue];
	self.role = [aDecoder decodeObjectForKey:kUserInfoBodyRole];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserInfoBody *copy = [UserInfoBody new];

	copy.email = [self.email copy];
	copy.headPortrait = [self.headPortrait copy];
	copy.idField = [self.idField copy];
	copy.mobile = [self.mobile copy];
	copy.nickname = [self.nickname copy];
	copy.openNotice = self.openNotice;
	copy.role = [self.role copy];

	return copy;
}
@end