//
//	Dynamic.m
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Dynamic.h"

NSString *const kDynamicMouth = @"mouth";
NSString *const kDynamicToday = @"today";

@interface Dynamic ()
@end
@implementation Dynamic




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDynamicMouth] isKindOfClass:[NSNull class]]){
		self.mouth = dictionary[kDynamicMouth];
	}	
	if(![dictionary[kDynamicToday] isKindOfClass:[NSNull class]]){
		self.today = dictionary[kDynamicToday];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.mouth != nil){
		dictionary[kDynamicMouth] = self.mouth;
	}
	if(self.today != nil){
		dictionary[kDynamicToday] = self.today;
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
	if(self.mouth != nil){
		[aCoder encodeObject:self.mouth forKey:kDynamicMouth];
	}
	if(self.today != nil){
		[aCoder encodeObject:self.today forKey:kDynamicToday];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.mouth = [aDecoder decodeObjectForKey:kDynamicMouth];
	self.today = [aDecoder decodeObjectForKey:kDynamicToday];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Dynamic *copy = [Dynamic new];

	copy.mouth = [self.mouth copy];
	copy.today = [self.today copy];

	return copy;
}
@end