//
//  NSString+MD5HexDigest.m
//  TestWebService
//
//  Created by user on 13-7-14.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import "NSString+MD5HexDigest.h"

@implementation NSString (md5)

-(NSString *) md5HexDigest {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}

@end
