
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import "HomeModel.h"

@implementation InfoClass
@end

@implementation TagsClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"imageList" : @"image_list", @"forumSort" : @"forum_sort", @"forumStatus" : @"forum_status", @"ID" : @"id", @"subNumber" : @"sub_number", @"postNumber" : @"post_number", @"columSet" : @"colum_set", @"displayLevel" : @"display_level",};
}
@end

@implementation ImageClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"thumbnailSmall" : @"thumbnail_small", @"downloadUrl" : @"download_url",};
}
@end

@implementation UClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"roomRole" : @"room_role", @"roomUrl" : @"room_url", @"roomName" : @"room_name", @"isVip" : @"is_vip", @"isV" : @"is_v", @"roomIcon" : @"room_icon",};
}
@end

@implementation VideoClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"thumbnailSmall" : @"thumbnail_small",};
}
@end

@implementation ListClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"ID" : @"id", @"isBest" : @"is_best", @"TYPE" : @"type", @"shareUrl" : @"share_url", @"topComments" : @"top_comments",};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"tags" : [TagsClass class],};
}
@end

@implementation HomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"list" : [ListClass class],};
}
@end