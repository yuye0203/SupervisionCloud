//
//	Body.m
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Body.h"

NSString *const kBodyList = @"list";
NSString *const kBodyPage = @"page";
NSString *const kBodyPages = @"pages";

@interface Body ()
@end
@implementation Body




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[kBodyList] != nil && [dictionary[kBodyList] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[kBodyList];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			KnowledgeModel * listItem = [[KnowledgeModel alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[kBodyPage] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[kBodyPage] integerValue];
	}

	if(![dictionary[kBodyPages] isKindOfClass:[NSNull class]]){
		self.pages = [dictionary[kBodyPages] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(KnowledgeModel * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[kBodyList] = dictionaryElements;
	}
	dictionary[kBodyPage] = @(self.page);
	dictionary[kBodyPages] = @(self.pages);
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
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:kBodyList];
	}
	[aCoder encodeObject:@(self.page) forKey:kBodyPage];	[aCoder encodeObject:@(self.pages) forKey:kBodyPages];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.list = [aDecoder decodeObjectForKey:kBodyList];
	self.page = [[aDecoder decodeObjectForKey:kBodyPage] integerValue];
	self.pages = [[aDecoder decodeObjectForKey:kBodyPages] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Body *copy = [Body new];

	copy.list = [self.list copy];
	copy.page = self.page;
	copy.pages = self.pages;

	return copy;
}
@end
