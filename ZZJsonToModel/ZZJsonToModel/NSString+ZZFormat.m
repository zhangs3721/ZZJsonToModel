#import "NSString+ZZFormat.h"

@implementation NSString (ZZFormat)

- (NSString *)uncapitalizeFirstCharacter
{    
    if (self.length == 0) {
        return @"";
    } else if (self.length == 1) {
        return self.lowercaseString;
    }
    NSString *lowercase = self.lowercaseString;
    NSString *firstLetter = [lowercase substringToIndex:1];
    NSString *restOfString = [self substringFromIndex:1];
    return [NSString stringWithFormat:@"%@%@", firstLetter, restOfString];
}

- (NSString *)zzFormatClassName {
    NSString *className = [[self stringByAppendingString:@""] capitalizedString];
    NSRange startsWithNumeral = [[className substringToIndex:1] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]];
    if ( !(startsWithNumeral.location == NSNotFound && startsWithNumeral.length == 0) ) {
        className = [@"Num" stringByAppendingString:className];
    }
    NSMutableArray *components = [[className componentsSeparatedByString:@"_"] mutableCopy];
    NSInteger numComponents = components.count;
    for (int i = 0; i < numComponents; ++i) {
        components[i] = [(NSString *)components[i] capitalizedString];
    }
    return [components componentsJoinedByString:@""];
}

- (NSString *)zzFormatPropertyName {
    NSString *temp = [self.zzFormatClassName uncapitalizeFirstCharacter];
    return [temp alphanumericStringIsReservedWord];
}

- (NSString *)alphanumericStringIsReservedWord {
    NSSet *reservedWords = [NSSet setWithObjects:@"id", @"abstract", @"case", @"catch", @"class", @"def", @"do", @"else", @"extends", @"false", @"final", @"finally", @"for", @"forSome", @"if", @"implicit", @"import", @"lazy", @"match", @"new", @"null", @"object", @"override", @"package", @"private", @"protected", @"return", @"sealed", @"super", @"this", @"throw", @"trait", @"try", @"true", @"type", @"val", @"var", @"while", @"with", @"yield", @"_", @":", @"=", @"=>", @"<-", @"<:", @"<%", @">:", @"#", @"@", nil];
    if ([reservedWords containsObject:self]) {
        return self.uppercaseString;
    }
    return self;
}

- (NSString *)uppercaseCamelcaseString {
    NSCharacterSet *nonAlphanumericCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"].invertedSet;
    NSMutableArray *components = [NSMutableArray arrayWithArray:[self componentsSeparatedByCharactersInSet:nonAlphanumericCharacterSet]];
    NSUInteger componentCount = components.count;
    
    for (NSUInteger i = 0; i < componentCount; ++i) {
        components[i] = [components[i] capitalizedString];
    }
    
    return [components componentsJoinedByString:@""];
}

@end
