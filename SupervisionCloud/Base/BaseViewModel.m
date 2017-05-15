//
//  BaseViewModel.m
//  SupervisionCloud
//
//  Created by YetingGe on 2017/5/2.
//  Copyright © 2017年 YetingGe. All rights reserved.
//

#import "BaseViewModel.h"
#import "SVCloudAPI.h"
#import "NSString+MD5HexDigest.h"

@implementation BaseViewModel

- (void)postWithUrl:(NSString *)url body:(NSData *)body showLoading:(BOOL)show success:(void(^)(NSDictionary *response))success failure:(void(^)(NSError *error))failure
{
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@", HOST_URL, url];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:requestUrl parameters:nil error:nil];
    request.timeoutInterval= 5;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置body
    [request setHTTPBody:body];
    
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
    
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            success(responseObject);
            
        } else {
            failure(error);
        }
    }] resume];
}

-(NSDictionary *)parametersWithDic:(NSMutableDictionary *)mdic{
    
    NSDictionary *cmdDic = @{@"cmd":[mdic objectForKey:@"cmd"]};
    [mdic removeObjectForKey:@"cmd"];
    NSArray *keysArray = [mdic allKeys];
    
    NSArray *resultArray = [keysArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    
    
    NSMutableString *vieryStr = [NSMutableString stringWithCapacity:20];
    
    for (NSString *key in resultArray){
        [vieryStr appendString:[NSString stringWithFormat:@"%@",mdic[key]]];
    }
    [vieryStr appendString:@"jianliyun"];
    
    [mdic addEntriesFromDictionary:@{@"verify":[vieryStr md5HexDigest]}];
    
    NSDictionary *temp = [NSDictionary dictionaryWithDictionary:mdic];
    [mdic removeAllObjects];
    
    [mdic addEntriesFromDictionary:cmdDic];
    [mdic addEntriesFromDictionary:@{@"params":temp}];
    
    return mdic;
    
}

@end
