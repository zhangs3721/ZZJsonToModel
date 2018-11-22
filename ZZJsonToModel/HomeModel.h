
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import <Foundation/Foundation.h>

@interface InfoClass : NSObject
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,copy  ) NSString *np;
@end

@interface TagsClass : NSObject
@property (nonatomic,copy  ) NSString *imageList;
@property (nonatomic,assign) NSInteger forumSort;
@property (nonatomic,assign) NSInteger forumStatus;
@property (nonatomic,assign) NSInteger ID;
@property (nonatomic,assign) NSInteger subNumber;
@property (nonatomic,assign) NSInteger postNumber;
@property (nonatomic,copy  ) NSString *name;
@property (nonatomic,assign) NSInteger columSet;
@property (nonatomic,assign) NSInteger displayLevel;
@property (nonatomic,copy  ) NSString *tail;
@property (nonatomic,copy  ) NSString *info;
@end

@interface ImageClass : NSObject
@property (nonatomic,strong) NSArray *medium;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,strong) NSArray *small;
@property (nonatomic,strong) NSArray *thumbnailSmall;
@property (nonatomic,strong) NSArray *downloadUrl;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,strong) NSArray *big;
@end

@interface UClass : NSObject
@property (nonatomic,copy  ) NSString *roomRole;
@property (nonatomic,copy  ) NSString *uid;
@property (nonatomic,strong) NSArray *header;
@property (nonatomic,copy  ) NSString *roomUrl;
@property (nonatomic,copy  ) NSString *roomName;
@property (nonatomic,assign) BOOL isVip;
@property (nonatomic,assign) BOOL isV;
@property (nonatomic,copy  ) NSString *roomIcon;
@property (nonatomic,assign) NSInteger relationship;
@property (nonatomic,copy  ) NSString *name;
@end

@interface VideoClass : NSObject
@property (nonatomic,strong) NSArray *thumbnail;
@property (nonatomic,assign) NSInteger height;
@property (nonatomic,strong) NSArray *download;
@property (nonatomic,assign) NSInteger width;
@property (nonatomic,assign) NSInteger playfcount;
@property (nonatomic,assign) NSInteger duration;
@property (nonatomic,strong) NSArray *thumbnailSmall;
@property (nonatomic,strong) NSArray *video;
@property (nonatomic,assign) NSInteger playcount;
@end

@interface ListClass : NSObject
@property (nonatomic,copy  ) NSString *ID;
@property (nonatomic,copy  ) NSString *up;
@property (nonatomic,assign) NSInteger isBest;
@property (nonatomic,strong) VideoClass *video;
@property (nonatomic,copy  ) NSString *passtime;
@property (nonatomic,strong) id cate;
@property (nonatomic,strong) NSArray<TagsClass *> *tags;
@property (nonatomic,copy  ) NSString *TYPE;
@property (nonatomic,copy  ) NSString *comment;
@property (nonatomic,strong) ImageClass *image;
@property (nonatomic,assign) NSInteger down;
@property (nonatomic,copy  ) NSString *text;
@property (nonatomic,copy  ) NSString *shareUrl;
@property (nonatomic,strong) UClass *u;
@property (nonatomic,assign) NSInteger forward;
@property (nonatomic,strong) NSArray *topComments;
@property (nonatomic,copy  ) NSString *bookmark;
@property (nonatomic,assign) NSInteger status;
@end

@interface HomeModel : NSObject
@property (nonatomic,strong) InfoClass *info;
@property (nonatomic,strong) NSArray<ListClass *> *list;
@end