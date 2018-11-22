
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import "NewsModel.h"

@implementation WheelsNewsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"ID" : @"id", @"TYPE" : @"type", @"imgUrl" : @"img_url",};
}
@end

@implementation ListNewsModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"classId" : @"class_id", @"videoImg" : @"video_img", @"imgUrl2" : @"img_url2", @"ID" : @"id", @"imgUrl1" : @"img_url1", @"createTime" : @"create_time", @"TYPE" : @"type", @"imgUrl" : @"img_url",};
}
@end

@implementation NewsModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"wheels" : [WheelsNewsModel class], @"list" : [ListNewsModel class],};
}
@end