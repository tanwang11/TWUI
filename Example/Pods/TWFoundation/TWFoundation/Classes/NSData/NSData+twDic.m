//
//  NSData+twDic.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSData+twDic.h"

@implementation NSData (twDic)

- (NSDictionary *)toDic {
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingAllowFragments error:nil];
}

@end
