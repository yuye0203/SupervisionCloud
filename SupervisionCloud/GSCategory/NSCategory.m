//
//  NSCategory.m
//  PW&DZ
//
//  Created by 俊宇&辉煌 on 11-4-7.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NSCategory.h"

@implementation NSObject (NSCategory)

+ (NSString*)isStringValue:(id)value
{
	if (value && [value isKindOfClass:[NSString class]]) {
		return value;
	}
	else {
		return @"";
	}
}

+ (NSString*)getStringValue:(id)value
{
	if (value) {
		if ([value isKindOfClass:[NSString class]]) {
			return value;
		}
		else if ([value isKindOfClass:[NSNumber class]]) {
			return [value stringValue];
		}
		else {
			return @"";
		}
        
	}
	else {
		return @"";
	}
}
@end



@implementation UIImage (NSCategory)

+ (UIImage*)createImage:(UIImage*)image inSize:(CGSize)size
{
	UIImage*		result;
	CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
	
    // each pixel is represented by four bytes
    // (8 bits each of R, G, B, and alpha)
    bitmapBytesPerRow   = (size.width * 4);
    bitmapByteCount     = (bitmapBytesPerRow * size.height);
	
    // create an RGB color space
    colorSpace = CGColorSpaceCreateDeviceRGB();
	
    // create the bitmap
    bitmapData = malloc( bitmapByteCount );
	memset( bitmapData, 0, bitmapByteCount );
	
    context = CGBitmapContextCreate(bitmapData,
									size.width,
									size.height,
									8,              // bits per component
									bitmapBytesPerRow,
									colorSpace,
									kCGImageAlphaPremultipliedFirst | kCGBitmapByteOrder32Host );
	if (!context) {
		free(bitmapData);
		CGColorSpaceRelease( colorSpace );
		bitmapData = NULL;
	}
	else {
        if (image.imageOrientation == UIImageOrientationRight)
		{
			CGContextTranslateCTM(context, 0, size.height);
			CGContextRotateCTM(context, -M_PI_2);
			CGContextDrawImage(context, CGRectMake(0, 0, size.height, size.width), [image CGImage]);
		}
		else if (image.imageOrientation == UIImageOrientationLeft)
		{
			CGContextTranslateCTM(context, size.width, 0);
			CGContextRotateCTM(context, M_PI_2);
			CGContextDrawImage(context, CGRectMake(0, 0, size.height, size.width), [image CGImage]);
		}
		else if (image.imageOrientation == UIImageOrientationDown)
		{
			CGContextTranslateCTM(context, size.width, size.height);
			CGContextRotateCTM(context, M_PI);
			CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), [image CGImage]);
		}
		else {
			CGContextDrawImage(context, CGRectMake(0, 0, size.width, size.height), [image CGImage]);
		}
		
		CGColorSpaceRelease( colorSpace );
		CGImageRef imageRef = CGBitmapContextCreateImage(context);
		
		if (imageRef != NULL)
		{
			result = [UIImage imageWithCGImage:imageRef];
			CGImageRelease(imageRef);
		}
		CGContextRelease( context );
		
		free(bitmapData);
		bitmapData = NULL;
	}
	return result;
}

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
	
	UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
	[image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
	UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return scaledImage;
}


- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
	UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
	[image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
	UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return reSizeImage;
}

@end

@implementation NSString (URLEncodingAdditions)

- (NSString*)stringByURLEncodingStringParameter
{
    // NSURL's stringByAddingPercentEscapesUsingEncoding: does not escape
    // some characters that should be escaped in URL parameters, like / and ?;
    // we'll use CFURL to force the encoding of those
    //
    // We'll explicitly leave spaces unescaped now, and replace them with +'s
    //
    // Reference: [url]http://www.ietf.org/rfc/rfc3986.txt[/url]
	
    NSString *resultStr = self;
	
    CFStringRef originalString = (__bridge CFStringRef) self;
    CFStringRef leaveUnescaped = CFSTR(" ");
    CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
	
    CFStringRef escapedStr;
    escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                         originalString,
                                                         leaveUnescaped,
                                                         forceEscaped,
                                                         kCFStringEncodingUTF8);
	
    if( escapedStr )
    {
        NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
        CFRelease(escapedStr);
		
        // replace spaces with plusses
        [mutableStr replaceOccurrencesOfString:@" "
                                    withString:@"%20"
                                       options:0
                                         range:NSMakeRange(0, [mutableStr length])];
        resultStr = mutableStr;
    }
    return resultStr;
}

- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)
	CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
											(CFStringRef)self,
											NULL,
											CFSTR("!*'();:@&amp;=+$,/?%#[] "),
											CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)));
    return result;
}

- (NSString*)URLDecodedString
{
    NSString *result = (NSString *)
	CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
															(CFStringRef)self,
															CFSTR(""),
															kCFStringEncodingUTF8));
    return result;
}

- (NSString *)stringByDecodingXMLEntities
{
    NSUInteger myLength = [self length];
    NSUInteger ampIndex = [self rangeOfString:@"&" options:NSLiteralSearch].location;
	
    // Short-circuit if there are no ampersands.
    if (ampIndex == NSNotFound) {
        return self;
    }
    // Make result string with some extra capacity.
    NSMutableString *result = [NSMutableString stringWithCapacity:(myLength * 1.25)];
	
    // First iteration doesn't need to scan to & since we did that already, but for code simplicity's sake we'll do it again with the scanner.
    NSScanner *scanner = [NSScanner scannerWithString:self];
	
    [scanner setCharactersToBeSkipped:nil];
	
    NSCharacterSet *boundaryCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@" \t\n\r;"];
	
    do {
        // Scan up to the next entity or the end of the string.
        NSString *nonEntityString;
        if ([scanner scanUpToString:@"&" intoString:&nonEntityString]) {
            [result appendString:nonEntityString];
        }
        if ([scanner isAtEnd]) {
            goto finish;
        }
        // Scan either a HTML or numeric character entity reference.
        if ([scanner scanString:@"&amp;" intoString:NULL])
            [result appendString:@"&"];
        else if ([scanner scanString:@"&apos;" intoString:NULL])
            [result appendString:@"'"];
        else if ([scanner scanString:@"&quot;" intoString:NULL])
            [result appendString:@"\""];
        else if ([scanner scanString:@"&lt;" intoString:NULL])
            [result appendString:@"<"];
        else if ([scanner scanString:@"&gt;" intoString:NULL])
            [result appendString:@">"];
		else if ([scanner scanString:@"&nbsp;" intoString:NULL])
            [result appendString:@" "];
        else if ([scanner scanString:@"&#" intoString:NULL]) {
            BOOL gotNumber;
            unsigned charCode;
            NSString *xForHex = @"";
			
            // Is it hex or decimal?
            if ([scanner scanString:@"x" intoString:&xForHex]) {
                gotNumber = [scanner scanHexInt:&charCode];
            }
            else {
                gotNumber = [scanner scanInt:(int*)&charCode];
            }
			
            if (gotNumber) {
                [result appendFormat:@"%C", charCode];
				
				[scanner scanString:@";" intoString:NULL];
            }
            else {
                NSString *unknownEntity = @"";
				
				[scanner scanUpToCharactersFromSet:boundaryCharacterSet intoString:&unknownEntity];
				
				
				[result appendFormat:@"&#%@%@", xForHex, unknownEntity];
				
                //[scanner scanUpToString:@";" intoString:&unknownEntity];
                //[result appendFormat:@"&#%@%@;", xForHex, unknownEntity];
                NSLog(@"Expected numeric character entity but got &#%@%@;", xForHex, unknownEntity);
				
            }
			
        }
        else {
			NSString *amp;
			
			[scanner scanString:@"&" intoString:&amp];      //an isolated & symbol
			[result appendString:amp];
			
			/*
			 NSString *unknownEntity = @"";
			 [scanner scanUpToString:@";" intoString:&unknownEntity];
			 NSString *semicolon = @"";
			 [scanner scanString:@";" intoString:&semicolon];
			 [result appendFormat:@"%@%@", unknownEntity, semicolon];
			 NSLog(@"Unsupported XML character entity %@%@", unknownEntity, semicolon);
			 */
        }
		
    }
    while (![scanner isAtEnd]);
	
finish:
    return result;
}


@end

