#import <Foundation/Foundation.h>

@interface ImagesClass : NSObject
@property (nonatomic,copy  ) NSString *raw;
@property (nonatomic,copy  ) NSString *format;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger errorCode;
@end

@interface CategoryClass : NSObject
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,copy  ) NSString *name;
@end

@interface AdminListClass : NSObject
@end

@interface AdminDataClass : NSObject
@end

@interface LogoUrlThumbClass : NSObject
@property (nonatomic,copy  ) NSString *raw;
@property (nonatomic,copy  ) NSString *format;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger errorCode;
@end

@interface CertClass : NSObject
@property (nonatomic,assign) NSInteger certUrlType;
@property (nonatomic,copy  ) NSString *homePage;
@property (nonatomic,copy  ) NSString *wechatId;
@property (nonatomic,copy  ) NSString *iosDownloadUrl;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,copy  ) NSString *androidDownloadUrl;
@property (nonatomic,copy  ) NSString *weiboUrl;
@property (nonatomic,assign) NSInteger certKindId;
@property (nonatomic,copy  ) NSString *iosStatsDownloadUrl;
@property (nonatomic,copy  ) NSString *appName;
@end

@interface CoordinateClass : NSObject
@property (nonatomic,assign) double latitude;
@property (nonatomic,assign) double longitude;
@property (nonatomic,copy  ) NSString *areaName;
@end

@interface AvatarUrlThumbClass : NSObject
@property (nonatomic,copy  ) NSString *raw;
@property (nonatomic,copy  ) NSString *format;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger errorCode;
@end

@interface MasterInfoClass : NSObject
@property (nonatomic,assign) NSInteger gender;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,assign) NSInteger horoscope;
@property (nonatomic,strong) AvatarUrlThumbClass *avatarUrlThumb;
@property (nonatomic,assign) BOOL isAnonymous;
@property (nonatomic,copy  ) NSString *userId;
@property (nonatomic,copy  ) NSString *selfDescription;
@property (nonatomic,copy  ) NSString *avatarUrl;
@property (nonatomic,strong) CoordinateClass *coordinate;
@end

@interface ThumbClass : NSObject
@property (nonatomic,copy  ) NSString *raw;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,copy  ) NSString *format;
@end

@interface GroupClass : NSObject
@property (nonatomic,copy  ) NSString *description;
@property (nonatomic,assign) NSInteger discussContentNum;
@property (nonatomic,copy  ) NSString *status;
@property (nonatomic,strong) NSArray<AdminDataClass *> *adminData;
@property (nonatomic,strong) NSArray<AdminListClass *> *adminList;
@property (nonatomic,assign) NSInteger campaignNum;
@property (nonatomic,strong) LogoUrlThumbClass *logoUrlThumb;
@property (nonatomic,assign) NSInteger certKindId;
@property (nonatomic,copy  ) NSString *logoUrl;
@property (nonatomic,assign) BOOL hasPlaylist;
@property (nonatomic,copy  ) NSString *category;
@property (nonatomic,assign) NSInteger kind;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,strong) CertClass *cert;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,strong) MasterInfoClass *masterInfo;
@property (nonatomic,copy  ) NSString *slogan;
@property (nonatomic,strong) ThumbClass *thumb;
@property (nonatomic,assign) NSInteger memberNum;
@property (nonatomic,assign) NSInteger topicContentNum;
@property (nonatomic,assign) NSInteger categoryId;
@property (nonatomic,assign) NSInteger publisherType;
@end

@interface ZCoordinateClass : NSObject
@property (nonatomic,assign) double latitude;
@property (nonatomic,assign) double longitude;
@property (nonatomic,copy  ) NSString *areaName;
@end

@interface ZAvatarUrlThumbClass : NSObject
@property (nonatomic,copy  ) NSString *raw;
@property (nonatomic,assign) NSInteger errorCode;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,copy  ) NSString *format;
@end

@interface UserClass : NSObject
@property (nonatomic,assign) NSInteger gender;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,assign) NSInteger horoscope;
@property (nonatomic,strong) ZAvatarUrlThumbClass *avatarUrlThumb;
@property (nonatomic,assign) BOOL isAnonymous;
@property (nonatomic,copy  ) NSString *userId;
@property (nonatomic,copy  ) NSString *selfDescription;
@property (nonatomic,copy  ) NSString *avatarUrl;
@property (nonatomic,strong) ZCoordinateClass *coordinate;
@end

@interface MeowClass : NSObject
@property (nonatomic,copy  ) NSString *description;
@property (nonatomic,assign) NSInteger imageCount;
@property (nonatomic,copy  ) NSString *title;
@property (nonatomic,assign) NSInteger objectType;
@property (nonatomic,copy  ) NSString *bannerImgUrl;
@property (nonatomic,copy  ) NSString *meowStatus;
@property (nonatomic,assign) NSInteger isPostByMaster;
@property (nonatomic,assign) NSInteger createTime;
@property (nonatomic,copy  ) NSString *shareText;
@property (nonatomic,assign) NSInteger bangCount;
@property (nonatomic,strong) NSArray<ImagesClass *> *images;
@property (nonatomic,strong) CategoryClass *category;
@property (nonatomic,assign) NSInteger kind;
@property (nonatomic,strong) GroupClass *group;
@property (nonatomic,assign) BOOL isExternalLink;
@property (nonatomic,assign) BOOL isFolded;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,assign) NSInteger isFiltered;
@property (nonatomic,strong) UserClass *user;
@property (nonatomic,copy  ) NSString *exposureUrl;
@property (nonatomic,assign) NSInteger meowType;
@property (nonatomic,assign) NSInteger commentCount;
@property (nonatomic,copy  ) NSString *author;
@property (nonatomic,copy  ) NSString *shareImg;
@end

@interface EntityListClass : NSObject
@property (nonatomic,strong) MeowClass *meow;
@end

@interface BaseModel : NSObject
@property (nonatomic,copy  ) NSString *start;
@property (nonatomic,assign) BOOL isLastPage;
@property (nonatomic,strong) NSArray<EntityListClass *> *entityList;
@end