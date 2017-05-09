//
//	UserInfoUserRoot.m
//
//	Create by 叶婷 葛 on 8/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "UserInfoUserRoot.h"

NSString *const kUserInfoUserRootBody = @"body";
NSString *const kUserInfoUserRootCmd = @"cmd";
NSString *const kUserInfoUserRootResultCode = @"resultCode";
NSString *const kUserInfoUserRootResultMessage = @"resultMessage";

@interface UserInfoUserRoot ()
@end
@implementation UserInfoUserRoot




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kUserInfoUserRootBody] isKindOfClass:[NSNull class]]){
		self.body = [[UserInfoBody alloc] initWithDictionary:dictionary[kUserInfoUserRootBody]];
	}

	if(![dictionary[kUserInfoUserRootCmd] isKindOfClass:[NSNull class]]){
		self.cmd = dictionary[kUserInfoUserRootCmd];
	}	
	if(![dictionary[kUserInfoUserRootResultCode] isKindOfClass:[NSNull class]]){
		self.resultCode = [dictionary[kUserInfoUserRootResultCode] integerValue];
	}

	if(![dictionary[kUserInfoUserRootResultMessage] isKindOfClass:[NSNull class]]){
		self.resultMessage = dictionary[kUserInfoUserRootResultMessage];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.body != nil){
		dictionary[kUserInfoUserRootBody] = [self.body toDictionary];
	}
	if(self.cmd != nil){
		dictionary[kUserInfoUserRootCmd] = self.cmd;
	}
	dictionary[kUserInfoUserRootResultCode] = @(self.resultCode);
	if(self.resultMessage != nil){
		dictionary[kUserInfoUserRootResultMessage] = self.resultMessage;
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
	if(self.body != nil){
		[aCoder encodeObject:self.body forKey:kUserInfoUserRootBody];
	}
	if(self.cmd != nil){
		[aCoder encodeObject:self.cmd forKey:kUserInfoUserRootCmd];
	}
	[aCoder encodeObject:@(self.resultCode) forKey:kUserInfoUserRootResultCode];	if(self.resultMessage != nil){
		[aCoder encodeObject:self.resultMessage forKey:kUserInfoUserRootResultMessage];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.body = [aDecoder decodeObjectForKey:kUserInfoUserRootBody];
	self.cmd = [aDecoder decodeObjectForKey:kUserInfoUserRootCmd];
	self.resultCode = [[aDecoder decodeObjectForKey:kUserInfoUserRootResultCode] integerValue];
	self.resultMessage = [aDecoder decodeObjectForKey:kUserInfoUserRootResultMessage];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	UserInfoUserRoot *copy = [UserInfoUserRoot new];

	copy.body = [self.body copy];
	copy.cmd = [self.cmd copy];
	copy.resultCode = self.resultCode;
	copy.resultMessage = [self.resultMessage copy];

	return copy;
}
@end