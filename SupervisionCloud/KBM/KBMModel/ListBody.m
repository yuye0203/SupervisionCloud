//
//	Body.m
//
//	Create by 叶婷 葛 on 3/5/2017
//	Copyright © 2017. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ListBody.h"
#import "QuestionModel.h"
#import "KnowledgeModel.h"

NSString *const kBodyHot = @"hot";
NSString *const kBodyQuestion = @"question";
NSString *const kBodyList = @"list";
NSString *const kBodyPage = @"page";
NSString *const kBodyPages = @"pages";

@interface ListBody ()
@end
@implementation ListBody




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(dictionary[kBodyHot] != nil && [dictionary[kBodyHot] isKindOfClass:[NSArray class]]){
        NSArray * hotDictionaries = dictionary[kBodyHot];
        NSMutableArray * hotItems = [NSMutableArray array];
        for(NSDictionary * hotDictionary in hotDictionaries){
            KnowledgeModel * hotItem = [[KnowledgeModel alloc] initWithDictionary:hotDictionary];
            [hotItems addObject:hotItem];
        }
        self.hot = hotItems;
    }
    if(dictionary[kBodyQuestion] != nil && [dictionary[kBodyQuestion] isKindOfClass:[NSArray class]]){
        NSArray * questionDictionaries = dictionary[kBodyQuestion];
        NSMutableArray * questionItems = [NSMutableArray array];
        for(NSDictionary * questionDictionary in questionDictionaries){
            QuestionModel * questionItem = [[QuestionModel alloc] initWithDictionary:questionDictionary];
            [questionItems addObject:questionItem];
        }
        self.question = questionItems;
    }
    if(dictionary[kBodyList] != nil && [dictionary[kBodyList] isKindOfClass:[NSArray class]]){
        NSArray * listDictionaries = dictionary[kBodyList];
        NSMutableArray * listItems = [NSMutableArray array];
        for(NSDictionary * listDictionary in listDictionaries){
            [listItems addObject:listDictionary];
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
    if(self.hot != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(KnowledgeModel * hotElement in self.hot){
            [dictionaryElements addObject:[hotElement toDictionary]];
        }
        dictionary[kBodyHot] = dictionaryElements;
    }
    if(self.question != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(QuestionModel * questionElement in self.question){
            [dictionaryElements addObject:[questionElement toDictionary]];
        }
        dictionary[kBodyQuestion] = dictionaryElements;
    }
    if(self.list != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(NSDictionary * listElement in self.list){
            [dictionaryElements addObject:listElement];
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
    if(self.hot != nil){
        [aCoder encodeObject:self.hot forKey:kBodyHot];
    }
    if(self.question != nil){
        [aCoder encodeObject:self.question forKey:kBodyQuestion];
    }
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
    self.hot = [aDecoder decodeObjectForKey:kBodyHot];
    self.question = [aDecoder decodeObjectForKey:kBodyQuestion];
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
    ListBody *copy = [ListBody new];
    
    copy.hot = [self.hot copy];
    copy.question = [self.question copy];
    copy.list = [self.list copy];
    copy.page = self.page;
    copy.pages = self.pages;

    
    return copy;
}
@end
