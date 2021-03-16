//
//  NSString+twTool.m
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSString+twTool.h"

@implementation NSString (twTool)

#pragma mark - 判断空字符串
+ (BOOL)isNullToString:(NSString * _Nullable)string {
    
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]){
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 正则部分
- (NSString *)replaceWithREG:(NSString * _Nonnull)reg newString:(NSString * _Nonnull)theNewString {
    if (!self) {
        return nil;
    }
    if (!reg || !theNewString) {
        return self;
    }
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *newSearchString = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:theNewString];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

- (NSString *)cleanWithREG:(NSString * _Nonnull)reg {
    if (!self) {
        return nil;
    }
    if (!reg) {
        return self;
    }
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
    NSString *newSearchString = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@""];
    //NSLog(@"New string: %@",newSearchString);
    return newSearchString;
}

- (NSString *)stringWithREG:(NSString * _Nonnull)reg {
    if (!self) {
        return nil;
    }
    if (!reg) {
        return nil;
    }
    
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:reg options:NSRegularExpressionCaseInsensitive error:&error];
    NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:self options:0 range:NSMakeRange(0, [self length])];
    if (!NSEqualRanges(rangeOfFirstMatch, NSMakeRange(NSNotFound, 0))) {
        NSString *substringForFirstMatch = [self substringWithRange:rangeOfFirstMatch];
        return substringForFirstMatch;
    }
    
    return @"";
}

#pragma mark - 10-16转换
+ (NSString *)stringToHexWithInt:(int)theNumber {
    return [NSString stringWithFormat:@"%x", (unsigned int) theNumber];
}

+ (NSString *)stringToDecimalWithString:(NSString * _Nonnull)theNumber {
    if (!theNumber) {
        return @"";
    }
    return [NSString stringWithFormat:@"%i", (int)strtoul([theNumber UTF8String], 0, 16)];
}

- (NSDictionary *)toDic {
    if (self.length == 0) {
        return nil;
    }
    
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&err];
    if(err) {
        return nil;
    }else{
        return dic;
    }
}

#pragma mark [获取 一个GUID]
+ (NSString *)getUUID {
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString * uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return uuid;
}

#pragma mark 空格URL
- (NSString *)toUrlEncode {
    // https://www.jianshu.com/p/ffbb95e01489
//    return CFBridgingRelease
//    (
//     CFURLCreateStringByAddingPercentEscapes
//     (
//      kCFAllocatorDefault,
//      (CFStringRef)self,
//      (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]",
//      NULL,
//      kCFStringEncodingUTF8
//      )
//     ) ;
    // 下面的方法,多次转换后,会不一样.不够安全.
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
}

- (NSString *)toUtf8Encode {
    return self.stringByRemovingPercentEncoding;
    //return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)toChinaPhoneString {
    if (self.length == 11) {
        return [NSString stringWithFormat:@"%@-%@-%@"
                , [self substringWithRange:(NSRange){0,3}]
                , [self substringWithRange:(NSRange){3,4}]
                , [self substringWithRange:(NSRange){7,4}]
                ];
    }
    return self;
}

- (BOOL)isPhoneNum {
    if (self.length == 11 &&
        [self replaceWithREG:@"\\d" newString:@""].length == 0) {
        return YES;
    }else{
        return NO;
    }
    //    //return YES;
    //    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[0678])\\d{8}$";
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    return [regextestmobile evaluateWithObject:self];
}

- (NSData *)toData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSInteger)countOccurencesOfString:(NSString * _Nonnull)searchString {
    if (!searchString) {
        return 0;
    }
    NSInteger strCount = [self length] - [[self stringByReplacingOccurrencesOfString:searchString withString:@""] length];
    return strCount / [searchString length];
}

- (UIColor *)toColor {
    if (self.length == 6) {
        int red   = (int)strtoul([[self substringWithRange:(NSRange){0, 2}] UTF8String], 0, 16);
        int green = (int)strtoul([[self substringWithRange:(NSRange){2, 2}] UTF8String], 0, 16);
        int blue  = (int)strtoul([[self substringWithRange:(NSRange){4, 2}] UTF8String], 0, 16);
        return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    }else{
        return [UIColor clearColor];
    }
}

@end
