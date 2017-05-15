//
//	Banner.m
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Banner.h"

NSString *const kBannerContract = @"project";
NSString *const kBannerDynamic = @"dynamic";
NSString *const kBannerPlan = @"plan";

@interface Banner ()
@end
@implementation Banner




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kBannerContract] isKindOfClass:[NSNull class]]){
		self.contract = [[Contract alloc] initWithDictionary:dictionary[kBannerContract]];
	}

	if(![dictionary[kBannerDynamic] isKindOfClass:[NSNull class]]){
		self.dynamic = [[Dynamic alloc] initWithDictionary:dictionary[kBannerDynamic]];
	}

	if(![dictionary[kBannerPlan] isKindOfClass:[NSNull class]]){
		self.plan = dictionary[kBannerPlan];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.contract != nil){
		dictionary[kBannerContract] = [self.contract toDictionary];
	}
	if(self.dynamic != nil){
		dictionary[kBannerDynamic] = [self.dynamic toDictionary];
	}
	if(self.plan != nil){
		dictionary[kBannerPlan] = self.plan;
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
	if(self.contract != nil){
		[aCoder encodeObject:self.contract forKey:kBannerContract];
	}
	if(self.dynamic != nil){
		[aCoder encodeObject:self.dynamic forKey:kBannerDynamic];
	}
	if(self.plan != nil){
		[aCoder encodeObject:self.plan forKey:kBannerPlan];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.contract = [aDecoder decodeObjectForKey:kBannerContract];
	self.dynamic = [aDecoder decodeObjectForKey:kBannerDynamic];
	self.plan = [aDecoder decodeObjectForKey:kBannerPlan];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Banner *copy = [Banner new];

	copy.contract = [self.contract copy];
	copy.dynamic = [self.dynamic copy];
	copy.plan = [self.plan copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"contract":kBannerContract};
}

@end
