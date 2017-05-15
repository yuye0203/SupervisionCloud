#import <UIKit/UIKit.h>

@interface UIImage (NSCategory)

- (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;
- (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;
@end



@interface NSString (URLEncodingAdditions)

- (NSString*)stringByURLEncodingStringParameter;

- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
- (NSString *)stringByDecodingXMLEntities;

@end

@interface NSObject (NSCategory)

+ (NSString*)isStringValue:(id)value;
+ (NSString*)getStringValue:(id)value;

@end
