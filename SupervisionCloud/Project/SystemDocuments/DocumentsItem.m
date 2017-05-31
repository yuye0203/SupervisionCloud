//
//	DocumentsItem.m
//
//	Create by 叶婷 葛 on 25/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DocumentsItem.h"

NSString *const kDocumentsItemImg = @"img";
NSString *const kDocumentsItemNeedCheckNum = @"need_check_num";
NSString *const kDocumentsItemNum = @"num";
NSString *const kDocumentsItemType = @"type";

@interface DocumentsItem ()
@end
@implementation DocumentsItem




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDocumentsItemImg] isKindOfClass:[NSNull class]]){
		self.img = dictionary[kDocumentsItemImg];
	}	
	if(![dictionary[kDocumentsItemNeedCheckNum] isKindOfClass:[NSNull class]]){
		self.needCheckNum = dictionary[kDocumentsItemNeedCheckNum];
	}	
	if(![dictionary[kDocumentsItemNum] isKindOfClass:[NSNull class]]){
		self.num = dictionary[kDocumentsItemNum];
	}	
	if(![dictionary[kDocumentsItemType] isKindOfClass:[NSNull class]]){
		self.type = dictionary[kDocumentsItemType];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.img != nil){
		dictionary[kDocumentsItemImg] = self.img;
	}
	if(self.needCheckNum != nil){
		dictionary[kDocumentsItemNeedCheckNum] = self.needCheckNum;
	}
	if(self.num != nil){
		dictionary[kDocumentsItemNum] = self.num;
	}
	if(self.type != nil){
		dictionary[kDocumentsItemType] = self.type;
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
	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:kDocumentsItemImg];
	}
	if(self.needCheckNum != nil){
		[aCoder encodeObject:self.needCheckNum forKey:kDocumentsItemNeedCheckNum];
	}
	if(self.num != nil){
		[aCoder encodeObject:self.num forKey:kDocumentsItemNum];
	}
	if(self.type != nil){
		[aCoder encodeObject:self.type forKey:kDocumentsItemType];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.img = [aDecoder decodeObjectForKey:kDocumentsItemImg];
	self.needCheckNum = [aDecoder decodeObjectForKey:kDocumentsItemNeedCheckNum];
	self.num = [aDecoder decodeObjectForKey:kDocumentsItemNum];
	self.type = [aDecoder decodeObjectForKey:kDocumentsItemType];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	DocumentsItem *copy = [DocumentsItem new];

	copy.img = [self.img copy];
	copy.needCheckNum = [self.needCheckNum copy];
	copy.num = [self.num copy];
	copy.type = [self.type copy];

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{

    return @{@"needCheckNum":kDocumentsItemNeedCheckNum,
            };
    
}



@end
