
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import <Foundation/Foundation.h>

@interface WheelsNewsModel : NSObject
@property (nonatomic,copy  ) NSString *ID;
@property (nonatomic,copy  ) NSString *title;
@property (nonatomic,copy  ) NSString *TYPE;
@property (nonatomic,copy  ) NSString *imgUrl;
@end

@interface ListNewsModel : NSObject
@property (nonatomic,copy  ) NSString *classId;
@property (nonatomic,copy  ) NSString *videoImg;
@property (nonatomic,copy  ) NSString *imgUrl2;
@property (nonatomic,copy  ) NSString *ID;
@property (nonatomic,copy  ) NSString *title;
@property (nonatomic,copy  ) NSString *imgUrl1;
@property (nonatomic,copy  ) NSString *createTime;
@property (nonatomic,copy  ) NSString *TYPE;
@property (nonatomic,copy  ) NSString *imgUrl;
@property (nonatomic,copy  ) NSString *intro;
@end

@interface NewsModel : NSObject
@property (nonatomic,copy  ) NSString *code;
@property (nonatomic,copy  ) NSString *message;
@property (nonatomic,strong) NSArray<WheelsNewsModel *> *wheels;
@property (nonatomic,strong) NSArray<ListNewsModel *> *list;
@end