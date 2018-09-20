
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526/13146615588）。

#import <Foundation/Foundation.h>

@interface NSString (ZZFormat)
/// 返回标准的类名
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *zzFormatClassName;
/// 返回标准的属性名
@property (NS_NONATOMIC_IOSONLY, readonly, copy) NSString *zzFormatPropertyName;
@end
