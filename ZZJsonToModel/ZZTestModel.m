
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526）。

#import "ZZTestModel.h"

@implementation AuthorsMjClass
@end

@implementation ZAuthorMjClass
@end

@implementation AuthorMjClass
@end

@implementation PagesMjClass
@end

@implementation IdMjClass
@end

@implementation BookInfoMjClass
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{ @"ID" : @"id",};
}
@end

@implementation ZZTestModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{ @"bookName" : @"book_name", @"bookInfo" : @"book_info",};
}
+ (NSDictionary *)mj_objectClassInArray {
    return @{ @"pages" : [PagesMjClass class], @"bookInfo" : [BookInfoMjClass class],};
}
@end