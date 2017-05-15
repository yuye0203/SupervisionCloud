//
//	Project.m
//
//	Create by 叶婷 葛 on 10/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Project.h"

NSString *const kProjectIdField = @"id";
NSString *const kProjectProjectName = @"project_name";

@interface Project ()
@end
@implementation Project




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kProjectIdField] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[kProjectIdField];
	}	
	if(![dictionary[kProjectProjectName] isKindOfClass:[NSNull class]]){
		self.projectName = dictionary[kProjectProjectName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.idField != nil){
		dictionary[kProjectIdField] = self.idField;
	}
	if(self.projectName != nil){
		dictionary[kProjectProjectName] = self.projectName;
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
	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:kProjectIdField];
	}
	if(self.projectName != nil){
		[aCoder encodeObject:self.projectName forKey:kProjectProjectName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.idField = [aDecoder decodeObjectForKey:kProjectIdField];
	self.projectName = [aDecoder decodeObjectForKey:kProjectProjectName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Project *copy = [Project new];

	copy.idField = [self.idField copy];
	copy.projectName = [self.projectName copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"idField":kProjectIdField,
             @"projectName":kProjectProjectName};
}

@end
