
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import <Foundation/Foundation.h>

@interface DataClass : NSObject
@property (nonatomic,copy  ) NSString *category;
@property (nonatomic,copy  ) NSString *thumbnailPicS;
@property (nonatomic,copy  ) NSString *thumbnailPicS03;
@property (nonatomic,copy  ) NSString *title;
@property (nonatomic,copy  ) NSString *uniquekey;
@property (nonatomic,copy  ) NSString *authorName;
@property (nonatomic,copy  ) NSString *date;
@property (nonatomic,copy  ) NSString *thumbnailPicS02;
@property (nonatomic,copy  ) NSString *url;
@end

@interface ResultClass : NSObject
@property (nonatomic,copy  ) NSString *stat;
@property (nonatomic,strong) NSArray<DataClass *> *data;
@end

@interface HomeModel : NSObject
@property (nonatomic,strong) ResultClass *result;
@property (nonatomic,assign) NSInteger errorCode;
@property (nonatomic,copy  ) NSString *reason;
@end