#import "NSArray+ZZFormat.h"

@implementation NSArray (ZZFormat)

- (NSArray *)returnSamePropertyWithArray:(NSArray *)otherArray {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF IN %@", otherArray];//不包含在subArray的元素
    return [self filteredArrayUsingPredicate:pre];
}

@end
