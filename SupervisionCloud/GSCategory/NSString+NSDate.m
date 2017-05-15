//
//  NSString+NSDate.m
//  Xiaozhu
//
//  Created by jimney on 2/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSString+NSDate.h"

@implementation NSString(Private)
// yyyy年MM月dd日
+(NSString*)stringChineseDateFormaterWithTimestampString:(NSString*)timestampString {
    long long timestamp = [timestampString longLongValue];
    
    NSString* dateString = [NSString stringChineseDateFormaterWithTimestamp:timestamp];
    
    return dateString;
}


+(NSString*)stringChineseDateFormaterWithTimestamp:(long long)timestamp {
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timestamp];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; 
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+(NSString*)stringChineseSeconedDateFormaterWithTimestamp:(NSString*)timestampString {
    
    long long timestamp = [timestampString longLongValue];

    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

+(NSString*)stringChineseSeconedDateFormaterWithTimestamp1:(NSString*)timestampString {
    
    long long timestamp = [timestampString longLongValue];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM.dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    return dateString;
}

@end
