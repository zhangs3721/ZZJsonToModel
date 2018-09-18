#import "BaseModel.h"

@implementation BookInfoClass
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"ID" : @"id",};
}
@end

@implementation AuthorsClass
@end

@implementation ZAuthorClass
@end

@implementation AuthorClass
@end

@implementation BaseModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{ @"bookName" : @"book_name", @"bookInfo" : @"book_info",};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{ @"bookInfo" : [BookInfoClass class],};
}
@end