
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import <Foundation/Foundation.h>

@interface AuthorsMjClass : NSObject
@property (nonatomic,assign) double author;
@end

@interface ZAuthorMjClass : NSObject
@property (nonatomic,strong) AuthorsMjClass *authors;
@property (nonatomic,copy  ) NSString *author;
@end

@interface AuthorMjClass : NSObject
@property (nonatomic,assign) BOOL bools;
@property (nonatomic,strong) ZAuthorMjClass *author;
@end

@interface PagesMjClass : NSObject
@end

@interface IdMjClass : NSObject
@property (nonatomic,copy  ) NSString *zzid;
@end

@interface BookInfoMjClass : NSObject
@property (nonatomic,copy  ) NSString *one;
@property (nonatomic,strong) IdMjClass *ID;
@property (nonatomic,copy  ) NSString *two;
@end

@interface ZZTestModel : NSObject
@property (nonatomic,strong) NSArray<PagesMjClass *> *pages;
@property (nonatomic,strong) AuthorMjClass *author;
@property (nonatomic,copy  ) NSString *bookName;
@property (nonatomic,strong) NSArray<BookInfoMjClass *> *bookInfo;
@end