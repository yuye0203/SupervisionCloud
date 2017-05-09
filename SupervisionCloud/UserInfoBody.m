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
NSString *const kUserInfoBodyJobNumber = @"job_number";
NSString *const kUserInfoBodySex = @"sex";
NSString *const kUserInfoBodyStatus = @"status";
NSString *const kUserInfoBodyDynamic = @"dynamic";
NSString *const kUserInfoBodyAuthToken = @"auth_token";
NSString *const kUserInfoBodyType = @"type";

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
    if(![dictionary[kUserInfoBodyJobNumber] isKindOfClass:[NSNull class]]){
        self.jobNumber = dictionary[kUserInfoBodyJobNumber];
    }
    if(![dictionary[kUserInfoBodySex] isKindOfClass:[NSNull class]]){
        self.sex = dictionary[kUserInfoBodySex];
    }
    if(![dictionary[kUserInfoBodyStatus] isKindOfClass:[NSNull class]]){
        self.status= dictionary[kUserInfoBodyStatus];
    }
    
    if(![dictionary[kUserInfoBodyDynamic] isKindOfClass:[NSNull class]]){
        self.dynamic = dictionary[kUserInfoBodyDynamic];
    }
    if(![dictionary[kUserInfoBodyAuthToken] isKindOfClass:[NSNull class]]){
        self.authToken = dictionary[kUserInfoBodyAuthToken];
    }
    if(![dictionary[kUserInfoBodyType] isKindOfClass:[NSNull class]]){
        self.type = [dictionary[kUserInfoBodyType] integerValue];
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
    if(self.jobNumber != nil){
        dictionary[kUserInfoBodyJobNumber] = self.jobNumber;
    }
    if(self.sex != nil){
        dictionary[kUserInfoBodySex] = self.sex;
    }
    if(self.dynamic != nil){
        dictionary[kUserInfoBodyDynamic] = self.dynamic;
    }
    if(self.status != nil){
        dictionary[kUserInfoBodyStatus] = self.status;
    }
    if(![dictionary[kUserInfoBodyAuthToken] isKindOfClass:[NSNull class]]){
        self.authToken = dictionary[kUserInfoBodyAuthToken];
    }
    if(![dictionary[kUserInfoBodyType] isKindOfClass:[NSNull class]]){
        self.type = [dictionary[kUserInfoBodyType] integerValue];
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
    
    if(self.sex != nil){
        [aCoder encodeObject:self.sex forKey:kUserInfoBodySex];
    }
    if(self.status != nil){
        [aCoder encodeObject:self.status forKey:kUserInfoBodyStatus];
    }
    if(self.dynamic != nil){
        [aCoder encodeObject:self.dynamic forKey:kUserInfoBodyDynamic];
    }
    if(self.jobNumber != nil){
        [aCoder encodeObject:self.jobNumber forKey:kUserInfoBodyJobNumber];
    }
    if(self.authToken != nil){
        [aCoder encodeObject:self.authToken forKey:kUserInfoBodyAuthToken];
    }
    [aCoder encodeObject:@(self.type) forKey:kUserInfoBodyType];

    
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
    self.jobNumber = [aDecoder decodeObjectForKey:kUserInfoBodyJobNumber];
    self.status = [aDecoder decodeObjectForKey:kUserInfoBodyStatus];
    self.sex = [aDecoder decodeObjectForKey:kUserInfoBodySex];
    self.dynamic = [aDecoder decodeObjectForKey:kUserInfoBodyDynamic];

    self.authToken = [aDecoder decodeObjectForKey:kUserInfoBodyAuthToken];
    self.type = [[aDecoder decodeObjectForKey:kUserInfoBodyType] integerValue];

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
    copy.jobNumber = [self.jobNumber copy];
    copy.sex = [self.sex copy];
    copy.status = [self.status copy];
    copy.dynamic = [self.dynamic copy];
    
    copy.authToken = [self.authToken copy];
    copy.type = self.type;

	return copy;
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"idField":kUserInfoBodyIdField,
             @"authToken":kUserInfoBodyAuthToken,
             @"headPortrait":kUserInfoBodyHeadPortrait,
             @"jobNumber":kUserInfoBodyJobNumber,
             @"openNotice":kUserInfoBodyOpenNotice};
        
}



@end
