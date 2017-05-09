//
//  NSString+MD5HexDigest.h
//  TestWebService
//
//  Created by user on 13-7-14.
//  Copyright (c) 2013年 user. All rights reserved.
//

#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface NSString (md5)
-(NSString *) md5HexDigest;
@end
