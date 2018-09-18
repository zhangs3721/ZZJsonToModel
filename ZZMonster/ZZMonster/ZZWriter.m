//
//  ZZWriter.m
//  ZZMonster
//
//  Created by zhang on 2018/9/10.
//  Copyright © 2018年 zhangs. All rights reserved.
//

#import "ZZWriter.h"
#import "NSString+ZZFormat.h"
#import "NSArray+ZZFormat.h"

@interface ZZWriter ()
@property (nonatomic, strong) NSMutableArray *classObjects;
@property (nonatomic, strong) NSMutableArray *classNames;
@end

@implementation ZZWriter

/// 写入文件
+ (void)writeClassObjectsWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName withJson:(NSDictionary *)json toFileURL:(NSURL *)url error:(NSError **)error {
    
    ZZWriter *writer = ZZWriter.new;
    // 整理出所有存在的类及类型
    [writer formatAllDict:json withFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName];
    
    // 输出.h
    NSString *hFilename = [NSString stringWithFormat:@"%@.h", fileName];
    NSString *outputHFile = [writer returnHStringWithFileName:fileName];
    [outputHFile writeToFile:[[url URLByAppendingPathComponent:hFilename] absoluteString]
                  atomically:YES
                    encoding:NSUTF8StringEncoding
                       error:error];
    if (!*error) {
        // 输出.m
        NSString *mFilename = [NSString stringWithFormat:@"%@.m", fileName];
        NSString *outputMFile = [writer returnMStringWithFileName:fileName withExtensionClassName:(NSString *)extensionName];
        [outputMFile writeToFile:[[url URLByAppendingPathComponent:mFilename] absoluteString]
                      atomically:YES
                        encoding:NSUTF8StringEncoding
                           error:error];
    }
}

#pragma mark - .h
/// 分析数据中基本元素的类型
- (NSDictionary *)analysisPropertyTypeWithDict:(NSDictionary *)dict {
    NSArray *keys = dict.allKeys;
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    for (NSString *key in keys) {
        if ([dict[key] isKindOfClass:[NSString class]]) {
            tempDict[key] = kkPropertyTypeString;
        }else if ([dict[key] isKindOfClass:[NSDictionary class]]) {
            tempDict[key] = [self analysisPropertyTypeWithDict:(NSDictionary *)dict[key]];
        }else if ([dict[key] isKindOfClass:[NSArray class]]) {
            NSMutableArray *array = [NSMutableArray array];
            for (id obj in (NSArray *)dict[key]) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    NSDictionary *temp = [self analysisPropertyTypeWithDict:obj];
                    [array addObject:temp];
                }
            }
            for (int i = 0; i < array.count-1; i++) {
                NSDictionary *dic1 = array[i];
                NSDictionary *dic2 = array[i+1];
                NSArray *samePropertys = [dic1.allKeys returnSamePropertyWithArray:dic2.allKeys];
                for (NSString *key in samePropertys) {
                    if (![dic1[key] isEqualToString:dic2[key]]) {
                        [dic1 setValue:kkPropertyTypeString forKey:key];
                        [dic2 setValue:kkPropertyTypeString forKey:key];
                    }
                }
            }
            tempDict[key] = array;
        }else if ([dict[key] isKindOfClass:[NSNull class]]) {
            tempDict[key] = kkPropertyTypeNull;
        }else {
            NSString *classDecription = [[dict[key] class] description];
            if ([classDecription containsString:@"NSCFBoolean"]) {
                tempDict[key] = kkPropertyTypeBool;
            }
            if ([classDecription containsString:@"NSCFNumber"]) {
                if (strcmp([dict[key] objCType], @encode(long)) == 0) {
                    tempDict[key] = kkPropertyTypeLong;
                }
                if (strcmp([dict[key] objCType], @encode(double)) == 0) {
                    tempDict[key] = kkPropertyTypeDouble;
                }
            }
        }
    }
    return tempDict;
}

/// 格式化数据中所有字典的类型
- (NSArray *)formatAllDict:(NSDictionary *)dict withFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName {
    NSDictionary *tempDic = [self analysisPropertyTypeWithDict:dict];
    self.classNames = [NSMutableArray array];
    self.classObjects = [NSMutableArray array];
    NSMutableDictionary *temp = [NSMutableDictionary dictionary];
    [temp setObject:tempDic forKey:fileName];
    [self findAllDicWith:temp withClassName:fileName withExtensionClassName:(NSString *)extensionName];
    return nil;
}

// 递归找到所有字典，并格式化为类
- (void)findAllDicWith:(NSDictionary *)dict withClassName:(NSString *)className withExtensionClassName:(NSString *)extensionName {
    NSArray *keys = dict.allKeys;
    for (NSString *key in keys) {
        id object = dict[key];
        if ([object isKindOfClass:[NSDictionary class]]) {
            // 这是个 类
            ZZClassObject *classObj = [[ZZClassObject alloc] init];
            classObj.className = className;
            // 格式化属性与类型
            NSString *tclassName = @"";
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:object];
            for (NSString *tkey in tempDic.allKeys) {
                if ([tempDic[tkey] isKindOfClass:[NSDictionary class]]) {
                    NSString *temp = [NSString stringWithFormat:@"%@_%@",tkey,extensionName];
                    tclassName = [self returnNewName:temp];
                    [tempDic setObject:tclassName forKey:tkey];
                }
            }
            classObj.classPropertys = tempDic;
            [self.classObjects addObject:classObj];
            // 递归
            [self findAllDicWith:object withClassName:tclassName withExtensionClassName:(NSString *)extensionName];
        }
        if ([object isKindOfClass:[NSArray class]]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            for (id obj in object) {
                if ([obj isKindOfClass:[NSDictionary class]]) {
                    [dict addEntriesFromDictionary:obj];
                }
            }
            ZZClassObject *classObj = [[ZZClassObject alloc] init];
            classObj.className = [NSString stringWithFormat:@"%@_%@",key,extensionName];
            // 格式化属性与类型
            NSString *tclassName = @"";
            NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithDictionary:dict];
            for (NSString *tkey in tempDic.allKeys) {
                if ([tempDic[tkey] isKindOfClass:[NSDictionary class]]) {
                    NSString *temp = [NSString stringWithFormat:@"%@_%@",tkey,extensionName];
                    tclassName = [self returnNewName:temp];
                    [tempDic setObject:tclassName forKey:tkey];
                }
            }
            classObj.classPropertys = tempDic;
            [self.classObjects addObject:classObj];
            // 递归
            [self findAllDicWith:dict withClassName:tclassName withExtensionClassName:(NSString *)extensionName];
        }
        
    }
}

- (NSString *)returnNewName:(NSString *)key {
    while ([self.classNames containsObject:key]) {
        key = [NSString stringWithFormat:@"%@_%@",@"z",key];
    }
    [self.classNames addObject:key];
    return key;
}

///  .h文件拼接元素
- (NSString *)hStringWithClassObject:(ZZClassObject *)classObj {
    NSString *classString = [NSString stringWithFormat:@"@interface %@ : NSObject",classObj.className.zzFormatClassName];
    NSDictionary *dict = classObj.classPropertys;
    NSArray *keys = dict.allKeys;
    for (NSString *key in keys) {
        id object = dict[key];
        NSString *propertyName = key.zzFormatPropertyName;
        NSString *temp = @"";
        if ([object isKindOfClass:[NSString class]]) {
            if ([object isEqualToString:kkPropertyTypeString]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,copy  ) NSString *%@;",propertyName];
            }
            if ([object isEqualToString:kkPropertyTypeDouble]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,assign) double %@;",propertyName];
            }
            if ([object isEqualToString:kkPropertyTypeLong]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,assign) NSInteger %@;",propertyName];
            }
            if ([object isEqualToString:kkPropertyTypeBool]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,assign) BOOL %@;",propertyName];
            }
            if ([object isEqualToString:kkPropertyTypeNull]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,copy  ) NSString *%@;",propertyName];
            }
            if ([object isEqualToString:kkPropertyTypeOther]) {
                temp = [NSString stringWithFormat:@"@property (nonatomic,copy  ) NSString *%@;",propertyName];
            }
            if ([self.classNames containsObject:object]) {
                NSString *className = ((NSString *)object).zzFormatClassName;
                temp = [NSString stringWithFormat:@"@property (nonatomic,strong) %@ *%@;",className,propertyName];
            }
        }
        if ([object isKindOfClass:[NSArray class]]) {
            temp = [NSString stringWithFormat:@"@property (nonatomic,strong) NSArray *%@;",propertyName];
        }
        classString = [NSString stringWithFormat:@"%@\n%@",classString,temp];
    }
    return [NSString stringWithFormat:@"%@\n@end",classString];
}

/// 返回 .h 文件的内容
- (NSString *)returnHStringWithFileName:(NSString *)fileName {
    // 准备返回 .h
    NSString *string = @"#import <Foundation/Foundation.h>";
    for (NSInteger i = self.classObjects.count-1; i >= 0; i--) {
        ZZClassObject *classObj = self.classObjects[i];
        NSString *temp = [self hStringWithClassObject:classObj];
        string = [NSString stringWithFormat:@"%@\n\n%@",string,temp];
    }
    string = [string stringByReplacingOccurrencesOfString:fileName.zzFormatClassName withString:fileName];
    return string;
}

#pragma mark - .m
/// 返回 .m 文件的内容
- (NSString *)returnMStringWithFileName:(NSString *)fileName withExtensionClassName:(NSString *)extensionName{
    // 准备返回 .m
    NSString *string = [NSString stringWithFormat:@"#import \"%@.h\"",fileName];
    for (NSInteger i = self.classObjects.count-1; i >= 0; i--) {
        ZZClassObject *classObj = self.classObjects[i];
        NSString *temp = [self mStringWithClassObject:classObj withExtensionClassName:(NSString *)extensionName];
        string = [NSString stringWithFormat:@"%@\n\n%@",string,temp];
    }
    string = [string stringByReplacingOccurrencesOfString:fileName.zzFormatClassName withString:fileName];
    return string;
}

- (NSString *)mStringWithClassObject:(ZZClassObject *)classObj withExtensionClassName:(NSString *)extensionName{
    NSString *stringa = @"+ (NSDictionary *)modelCustomPropertyMapper {\n    return @{";
    NSString *stringb = @"};\n}\n";
    NSString *stringc = @"+ (NSDictionary *)modelContainerPropertyGenericClass {\n    return @{";
    NSString *stringd = @"};\n}\n";
    // modelCustomPropertyMapper
    NSString *string = @"";
    // modelContainerPropertyGenericClass
    NSString *strings = @"";
    // 解析
    NSArray *keys = classObj.classPropertys.allKeys;
    for (NSString *key in keys) {
        id object = classObj.classPropertys[key];
        if (![key isEqualToString:key.zzFormatPropertyName]) {
            string = [NSString stringWithFormat:@"%@ @\"%@\" : @\"%@\",",string,key.zzFormatPropertyName,key];
        }
        if ([object isKindOfClass:[NSArray class]]) {
            NSString *className = [NSString stringWithFormat:@"%@_%@",key,extensionName];
            strings = [NSString stringWithFormat:@"%@ @\"%@\" : [%@ class],",strings,key.zzFormatPropertyName,className.zzFormatClassName];
        }
    }
    string = string.length > 0 ? [NSString stringWithFormat:@"%@%@%@",stringa,string,stringb] : @"";
    strings = strings.length > 0 ? [NSString stringWithFormat:@"%@%@%@",stringc,strings,stringd] : @"";

    NSString *stringe = [NSString stringWithFormat:@"@implementation %@\n",classObj.className.zzFormatClassName];
    return [NSString stringWithFormat:@"%@%@%@@end",stringe,string,strings];
}

@end

@implementation ZZClassObject
@end
