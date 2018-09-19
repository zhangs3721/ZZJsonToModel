//
//  ZZWriter.h
//  ZZMonster
//
//  Created by zhang on 2018/9/10.
//  Copyright © 2018年 zhangs. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface ZZWriter : NSObject

/*  调用方法
 *  FileName: 文件名
 *  ExtensionClassName: 为预防自动生成的类名重复。例Authors类后加后缀->AuthorsClass，不会污染数据。
 *  Json: 请求到的json，默认是（NSDictionary *）json。
 *  URL: 生成文件存放的路径。
 *  error: 生成文件发生错误
 */
+ (void)writeClassObjectsWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName  withJson:(NSDictionary *)json toFileURL:(NSURL *)url error:(NSError **)error;

/// 返回 .h 文件的内容
- (NSString *)returnHStringWithFileName:(NSString *)fileName;

/// 返回 .m 文件的内容
- (NSString *)returnMStringWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName;

/// 格式化数据中所有字典的类型
- (void)willFormat:(NSDictionary *)dict withFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName;

@end

