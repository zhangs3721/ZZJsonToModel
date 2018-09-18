#import <Foundation/Foundation.h>

@interface BookInfoClass : NSObject
@property (nonatomic,copy  ) NSString *one;
@property (nonatomic,copy  ) NSString *ID;
@end

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

@interface BaseModel : NSObject
@property (nonatomic,assign) NSInteger pages;
@property (nonatomic,strong) AuthorClass *author;
@property (nonatomic,copy  ) NSString *bookName;
@property (nonatomic,strong) NSArray *bookInfo;
@end