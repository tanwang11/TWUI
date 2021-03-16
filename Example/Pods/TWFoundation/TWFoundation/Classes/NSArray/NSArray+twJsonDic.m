//
//  NSArray+twJsonDic.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSArray+twJsonDic.h"

@implementation NSArray (twJsonDic)

- (NSString *)toJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:nil];
    
    if (data == nil) {
        return nil;
    }
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

- (NSString *)toReadableJSONString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    if (data == nil) {
        return nil;
    }
    
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

- (NSData *)toJSONData {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    
    return data;
}

@end
