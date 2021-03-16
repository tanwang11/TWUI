//
//  NSDictionary+twTool.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSDictionary+twTool.h"

@implementation NSDictionary (twTool)

- (NSString *)toJsonString {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end
