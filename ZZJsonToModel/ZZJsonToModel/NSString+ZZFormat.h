#import <Foundation/Foundation.h>

@interface NSString (ZZFormat)
/// 返回标准的类名
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *zzFormatClassName;
/// 返回标准的属性名
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *zzFormatPropertyName;
@end
