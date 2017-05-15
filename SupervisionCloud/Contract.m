//
//	Contract.m
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Contract.h"

NSString *const kContractContractNumber = @"contract_number";
NSString *const kContractStartTime = @"start_time";

@interface Contract ()
@end
@implementation Contract




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kContractContractNumber] isKindOfClass:[NSNull class]]){
		self.contractNumber = dictionary[kContractContractNumber];
	}	
	if(![dictionary[kContractStartTime] isKindOfClass:[NSNull class]]){
		self.startTime = dictionary[kContractStartTime];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.contractNumber != nil){
		dictionary[kContractContractNumber] = self.contractNumber;
	}
	if(self.startTime != nil){
		dictionary[kContractStartTime] = self.startTime;
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
	if(self.contractNumber != nil){
		[aCoder encodeObject:self.contractNumber forKey:kContractContractNumber];
	}
	if(self.startTime != nil){
		[aCoder encodeObject:self.startTime forKey:kContractStartTime];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.contractNumber = [aDecoder decodeObjectForKey:kContractContractNumber];
	self.startTime = [aDecoder decodeObjectForKey:kContractStartTime];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Contract *copy = [Contract new];

	copy.contractNumber = [self.contractNumber copy];
	copy.startTime = [self.startTime copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"contractNumber":kContractContractNumber,
             @"startTime":kContractStartTime};
}


@end
