//
//  NSString+NSDate.h
//  Xiaozhu
//
//  Created by jimney on 2/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(NSDate)
/*@brief 根据timestampString字符串　返回中文日期格式：yyyy年MM月dd日
*/ 
+(NSString*)stringChineseDateFormaterWithTimestampString:(NSString*)timestampString;

/*@brief 根据timestamp长整型值　返回中文日期格式：yyyy年MM月dd日
 */ 
+(NSString*)stringChineseDateFormaterWithTimestamp:(long long)timestamp;

/*@brief 根据timestampString字符串　返回中文日期格式：yyyy-MM-dd HH:mm:ss
 */

+(NSString*)stringChineseSeconedDateFormaterWithTimestamp:(NSString*)timestampString;

//MM.dd
+(NSString*)stringChineseSeconedDateFormaterWithTimestamp1:(NSString*)timestampString;

@end
