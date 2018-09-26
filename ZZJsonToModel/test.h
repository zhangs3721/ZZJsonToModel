
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526/13146615588）。

#import <Foundation/Foundation.h>

@interface AuthorsClass : NSObject
@property (nonatomic,assign) double author;
@end

@interface ZAuthorClass : NSObject
@property (nonatomic,strong) AuthorsClass *authors;
@property (nonatomic,copy  ) NSString *author;
@end

@interface AuthorClass : NSObject
@property (nonatomic,assign) BOOL bools;
@property (nonatomic,strong) ZAuthorClass *author;
@end

@interface PagesClass : NSObject
@end

@interface IdClass : NSObject
@property (nonatomic,copy  ) NSString *zzid;
@end

@interface BookInfoClass : NSObject
@property (nonatomic,copy  ) NSString *one;
@property (nonatomic,strong) IdClass *ID;
@property (nonatomic,copy  ) NSString *two;
@end

@interface test : NSObject
@property (nonatomic,strong) NSArray<PagesClass *> *pages;
@property (nonatomic,strong) AuthorClass *author;
@property (nonatomic,copy  ) NSString *bookName;
@property (nonatomic,strong) NSArray<BookInfoClass *> *bookInfo;
@end