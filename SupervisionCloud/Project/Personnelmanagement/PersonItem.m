//
//	PersonItem.m
//
//	Create by 叶婷 葛 on 25/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PersonItem.h"

NSString *const kPersonItemDynamic = @"dynamic";
NSString *const kPersonItemHeadPortrait = @"head_portrait";
NSString *const kPersonItemIdField = @"id";
NSString *const kPersonItemIntention = @"intention";
NSString *const kPersonItemJobNumber = @"job_number";
NSString *const kPersonItemMobile = @"mobile";
NSString *const kPersonItemNickname = @"nickname";
NSString *const kPersonItemProjectName = @"project_name";
NSString *const kPersonItemRemoveTime = @"remove_time";
NSString *const kPersonItemRole = @"role";
NSString *const kPersonItemSex = @"sex";
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
	if(![dictionary[kPersonItemDynamic] isKindOfClass:[NSNull class]]){
		self.dynamic = dictionary[kPersonItemDynamic];
	}	
	if(![dictionary[kPersonItemHeadPortrait] isKindOfClass:[NSNull class]]){
		self.headPortrait = dictionary[kPersonItemHeadPortrait];
	}	
	if(![dictionary[kPersonItemIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kPersonItemIdField];
	}	
	if(![dictionary[kPersonItemIntention] isKindOfClass:[NSNull class]]){
		self.intention = dictionary[kPersonItemIntention];
	}	
	if(![dictionary[kPersonItemJobNumber] isKindOfClass:[NSNull class]]){
		self.jobNumber = dictionary[kPersonItemJobNumber];
	}	
	if(![dictionary[kPersonItemMobile] isKindOfClass:[NSNull class]]){
		self.mobile = dictionary[kPersonItemMobile];
	}	
	if(![dictionary[kPersonItemNickname] isKindOfClass:[NSNull class]]){
		self.nickname = dictionary[kPersonItemNickname];
	}	
	if(![dictionary[kPersonItemProjectName] isKindOfClass:[NSNull class]]){
		self.projectName = dictionary[kPersonItemProjectName];
	}	
	if(![dictionary[kPersonItemRemoveTime] isKindOfClass:[NSNull class]]){
		self.removeTime = dictionary[kPersonItemRemoveTime];
	}	
	if(![dictionary[kPersonItemRole] isKindOfClass:[NSNull class]]){
		self.role = dictionary[kPersonItemRole];
	}	
	if(![dictionary[kPersonItemSex] isKindOfClass:[NSNull class]]){
		self.sex = dictionary[kPersonItemSex];
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
	if(self.dynamic != nil){
		dictionary[kPersonItemDynamic] = self.dynamic;
	}
	if(self.headPortrait != nil){
		dictionary[kPersonItemHeadPortrait] = self.headPortrait;
	}
	if(self.idField != nil){
		dictionary[kPersonItemIdField] = self.idField;
	}
	if(self.intention != nil){
		dictionary[kPersonItemIntention] = self.intention;
	}
	if(self.jobNumber != nil){
		dictionary[kPersonItemJobNumber] = self.jobNumber;
	}
	if(self.mobile != nil){
		dictionary[kPersonItemMobile] = self.mobile;
	}
	if(self.nickname != nil){
		dictionary[kPersonItemNickname] = self.nickname;
	}
	if(self.projectName != nil){
		dictionary[kPersonItemProjectName] = self.projectName;
	}
	if(self.removeTime != nil){
		dictionary[kPersonItemRemoveTime] = self.removeTime;
	}
	if(self.role != nil){
		dictionary[kPersonItemRole] = self.role;
	}
	if(self.sex != nil){
		dictionary[kPersonItemSex] = self.sex;
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
	if(self.dynamic != nil){
		[aCoder encodeObject:self.dynamic forKey:kPersonItemDynamic];
	}
	if(self.headPortrait != nil){
		[aCoder encodeObject:self.headPortrait forKey:kPersonItemHeadPortrait];
	}
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kPersonItemIdField];
	}
	if(self.intention != nil){
		[aCoder encodeObject:self.intention forKey:kPersonItemIntention];
	}
	if(self.jobNumber != nil){
		[aCoder encodeObject:self.jobNumber forKey:kPersonItemJobNumber];
	}
	if(self.mobile != nil){
		[aCoder encodeObject:self.mobile forKey:kPersonItemMobile];
	}
	if(self.nickname != nil){
		[aCoder encodeObject:self.nickname forKey:kPersonItemNickname];
	}
	if(self.projectName != nil){
		[aCoder encodeObject:self.projectName forKey:kPersonItemProjectName];
	}
	if(self.removeTime != nil){
		[aCoder encodeObject:self.removeTime forKey:kPersonItemRemoveTime];
	}
	if(self.role != nil){
		[aCoder encodeObject:self.role forKey:kPersonItemRole];
	}
	if(self.sex != nil){
		[aCoder encodeObject:self.sex forKey:kPersonItemSex];
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
	self.dynamic = [aDecoder decodeObjectForKey:kPersonItemDynamic];
	self.headPortrait = [aDecoder decodeObjectForKey:kPersonItemHeadPortrait];
	self.idField = [aDecoder decodeObjectForKey:kPersonItemIdField];
	self.intention = [aDecoder decodeObjectForKey:kPersonItemIntention];
	self.jobNumber = [aDecoder decodeObjectForKey:kPersonItemJobNumber];
	self.mobile = [aDecoder decodeObjectForKey:kPersonItemMobile];
	self.nickname = [aDecoder decodeObjectForKey:kPersonItemNickname];
	self.projectName = [aDecoder decodeObjectForKey:kPersonItemProjectName];
	self.removeTime = [aDecoder decodeObjectForKey:kPersonItemRemoveTime];
	self.role = [aDecoder decodeObjectForKey:kPersonItemRole];
	self.sex = [aDecoder decodeObjectForKey:kPersonItemSex];
	self.status = [aDecoder decodeObjectForKey:kPersonItemStatus];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	PersonItem *copy = [PersonItem new];

	copy.dynamic = [self.dynamic copy];
	copy.headPortrait = [self.headPortrait copy];
	copy.idField = [self.idField copy];
	copy.intention = [self.intention copy];
	copy.jobNumber = [self.jobNumber copy];
	copy.mobile = [self.mobile copy];
	copy.nickname = [self.nickname copy];
	copy.projectName = [self.projectName copy];
	copy.removeTime = [self.removeTime copy];
	copy.role = [self.role copy];
	copy.sex = [self.sex copy];
	copy.status = [self.status copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{

    return @{
             @"idField":kPersonItemIdField,
             @"removeTime":kPersonItemRemoveTime,
             @"projectName":kPersonItemProjectName,
             @"headPortrait":kPersonItemHeadPortrait,
             @"jobNumber":kPersonItemJobNumber
             };
    
}

@end
