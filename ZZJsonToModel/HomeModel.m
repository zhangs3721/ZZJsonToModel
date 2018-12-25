
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import "HomeModel.h"

@implementation DataClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"thumbnailPicS" : @"thumbnail_pic_s", @"thumbnailPicS03" : @"thumbnail_pic_s03", @"authorName" : @"author_name", @"thumbnailPicS02" : @"thumbnail_pic_s02",};
}
@end

@implementation ResultClass
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"data" : [DataClass class],};
}
@end

@implementation HomeModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"errorCode" : @"error_code",};
}
@end