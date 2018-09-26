
// ZZJsonToModel(GitHub:https://github.com/zhangs3721/ZZJsonToModel )
// 纯代码编写，无需安装任何插件，一个方法轻松搞定复杂Json转Model。
// 如果 ZZJsonToModel 为您节约了时间，您的**🌟星星**是我优化项目的动力，谢谢🙏🙏🙏
// 如果您发现了bug，或有新的想法和建议，请及时通知我qq（461818526/13146615588）。

#import <Foundation/Foundation.h>

#define ZZJsonToModelDeprecated(instead) __attribute__((deprecated(instead)))
typedef void(^Error)(NSError *error);
typedef void(^DoSth)(void);

static NSString *const kkPropertyTypeString = @"kkZZMonsterNSString";
static NSString *const kkPropertyTypeArray = @"kkZZMonsterNSArray";
static NSString *const kkPropertyTypeDictionary = @"kkZZMonsterNSDictionary";
static NSString *const kkPropertyTypeDouble = @"kkZZMonsterDouble";
static NSString *const kkPropertyTypeLong = @"kkZZMonsterNSInteger";
static NSString *const kkPropertyTypeBool = @"kkZZMonsterBOOL";
static NSString *const kkPropertyTypeNull = @"kkZZMonsterNull";
static NSString *const kkPropertyTypeOther = @"kkZZMonsterOther";

@interface ZZClassObject : NSObject
@property (nonatomic,copy  ) NSString *className;
@property (nonatomic,strong) NSDictionary *classPropertys;
@end

@interface ZZJsonToModel : NSObject

#pragma mark 主方法一个就够了
/**
 调用方法 -- main

 @param fileName 文件名
 @param extensionName 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据。
 @param json 请求到的json，默认是（NSDictionary *）json。
 @param url 生成文件存放的路径。
 @param error 生成文件发生错误
 */
+ (void)writeClassObjectsWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName  withJson:(NSDictionary *)json toFileURL:(NSURL *)url error:(NSError **)error ZZJsonToModelDeprecated("请使用modelWithFileName:extensionName:json:fileURL:error:");

/**
 调用方法 -- main
 
 @param fileName 生成文件的文件名
 @param extensionName 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据
 @param json 请求到的json，传入类型默认是（NSDictionary *）json
 @param url 生成文件存放的路径
 @param error 生成文件发生错误
 @return 是否成功生成文件
 */
+ (BOOL)modelWithFileName:(NSString *)fileName extensionName:(NSString *)extensionName json:(NSDictionary *)json fileURL:(NSURL *)url error:(Error)error;

/**
 计算代码耗时

 @param doSth 代码块
 @return 耗时
 */
+ (double)modelWithSpendTime:(DoSth)doSth;
#pragma mark -

/// 返回 .h 文件的内容
- (NSString *)returnHStringWithFileName:(NSString *)fileName;

/// 返回 .m 文件的内容
- (NSString *)returnMStringWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName;

/// 格式化数据中所有字典的类型
- (void)willFormat:(NSDictionary *)dict withFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName;

@end

