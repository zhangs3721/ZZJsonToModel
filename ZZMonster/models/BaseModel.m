#import "BaseModel.h"

@implementation ImagesClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"errorCode" : @"error_code",};
}
@end

@implementation CategoryClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"ID" : @"id",};
}
@end

@implementation AdminListClass
@end

@implementation AdminDataClass
@end

@implementation LogoUrlThumbClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"errorCode" : @"error_code",};
}
@end

@implementation CertClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"certUrlType" : @"cert_url_type", @"homePage" : @"home_page", @"wechatId" : @"wechat_id", @"iosDownloadUrl" : @"ios_download_url", @"ID" : @"id", @"androidDownloadUrl" : @"android_download_url", @"weiboUrl" : @"weibo_url", @"certKindId" : @"cert_kind_id", @"iosStatsDownloadUrl" : @"ios_stats_download_url", @"appName" : @"app_name",};
}
@end

@implementation CoordinateClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"areaName" : @"area_name",};
}
@end

@implementation AvatarUrlThumbClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"errorCode" : @"error_code",};
}
@end

@implementation MasterInfoClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"avatarUrlThumb" : @"avatar_url_thumb", @"isAnonymous" : @"is_anonymous", @"userId" : @"user_id", @"selfDescription" : @"self_description", @"avatarUrl" : @"avatar_url",};
}
@end

@implementation ThumbClass
@end

@implementation GroupClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"discussContentNum" : @"discuss_content_num", @"adminData" : @"admin_data", @"adminList" : @"admin_list", @"campaignNum" : @"campaign_num", @"logoUrlThumb" : @"logo_url_thumb", @"certKindId" : @"cert_kind_id", @"logoUrl" : @"logo_url", @"hasPlaylist" : @"has_playlist", @"ID" : @"id", @"masterInfo" : @"master_info", @"memberNum" : @"member_num", @"topicContentNum" : @"topic_content_num", @"categoryId" : @"category_id", @"publisherType" : @"publisher_type",};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"adminData" : [AdminDataClass class], @"adminList" : [AdminListClass class],};
}
@end

@implementation ZCoordinateClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"areaName" : @"area_name",};
}
@end

@implementation ZAvatarUrlThumbClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"errorCode" : @"error_code",};
}
@end

@implementation UserClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"avatarUrlThumb" : @"avatar_url_thumb", @"isAnonymous" : @"is_anonymous", @"userId" : @"user_id", @"selfDescription" : @"self_description", @"avatarUrl" : @"avatar_url",};
}
@end

@implementation MeowClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"imageCount" : @"image_count", @"objectType" : @"object_type", @"bannerImgUrl" : @"banner_img_url", @"meowStatus" : @"meow_status", @"isPostByMaster" : @"is_post_by_master", @"createTime" : @"create_time", @"shareText" : @"share_text", @"bangCount" : @"bang_count", @"isExternalLink" : @"is_external_link", @"isFolded" : @"is_folded", @"ID" : @"id", @"isFiltered" : @"is_filtered", @"exposureUrl" : @"exposure_url", @"meowType" : @"meow_type", @"commentCount" : @"comment_count", @"shareImg" : @"share_img",};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"images" : [ImagesClass class],};
}
@end

@implementation EntityListClass
@end

@implementation BaseModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"isLastPage" : @"is_last_page", @"entityList" : @"entity_list",};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"entityList" : [EntityListClass class],};
}
@end