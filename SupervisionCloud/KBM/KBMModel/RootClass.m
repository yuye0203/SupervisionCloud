//
//	RootClass.m
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "RootClass.h"

NSString *const kRootClassBody = @"body";
NSString *const kRootClassCmd = @"cmd";
NSString *const kRootClassResultCode = @"resultCode";
NSString *const kRootClassResultMessage = @"resultMessage";

@interface RootClass ()
@end
@implementation RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kRootClassBody] isKindOfClass:[NSNull class]]){
		self.body = [[Body alloc] initWithDictionary:dictionary[kRootClassBody]];
	}

	if(![dictionary[kRootClassCmd] isKindOfClass:[NSNull class]]){
		self.cmd = dictionary[kRootClassCmd];
	}	
	if(![dictionary[kRootClassResultCode] isKindOfClass:[NSNull class]]){
		self.resultCode = [dictionary[kRootClassResultCode] integerValue];
	}

	if(![dictionary[kRootClassResultMessage] isKindOfClass:[NSNull class]]){
		self.resultMessage = dictionary[kRootClassResultMessage];
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
		dictionary[kRootClassBody] = [self.body toDictionary];
	}
	if(self.cmd != nil){
		dictionary[kRootClassCmd] = self.cmd;
	}
	dictionary[kRootClassResultCode] = @(self.resultCode);
	if(self.resultMessage != nil){
		dictionary[kRootClassResultMessage] = self.resultMessage;
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
		[aCoder encodeObject:self.body forKey:kRootClassBody];
	}
	if(self.cmd != nil){
		[aCoder encodeObject:self.cmd forKey:kRootClassCmd];
	}
	[aCoder encodeObject:@(self.resultCode) forKey:kRootClassResultCode];	if(self.resultMessage != nil){
		[aCoder encodeObject:self.resultMessage forKey:kRootClassResultMessage];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.body = [aDecoder decodeObjectForKey:kRootClassBody];
	self.cmd = [aDecoder decodeObjectForKey:kRootClassCmd];
	self.resultCode = [[aDecoder decodeObjectForKey:kRootClassResultCode] integerValue];
	self.resultMessage = [aDecoder decodeObjectForKey:kRootClassResultMessage];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	RootClass *copy = [RootClass new];

	copy.body = [self.body copy];
	copy.cmd = [self.cmd copy];
	copy.resultCode = self.resultCode;
	copy.resultMessage = [self.resultMessage copy];

	return copy;
}
@end