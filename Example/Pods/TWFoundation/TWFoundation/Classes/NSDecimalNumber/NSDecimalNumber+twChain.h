//
//  NSDecimalNumber+twChain.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define DecNumStr(string) [NSDecimalNumber decimalNumberWithString:string]

/**
    参考文档  https://www.jianshu.com/p/788b2c89f5d0
 */
@interface NSDecimalNumber (twChain)

#pragma mark - 用于小数精确计算的加减乘除
- (NSDecimalNumber *(^)(NSDecimalNumber *))add;
- (NSDecimalNumber *(^)(NSDecimalNumber *))sub;
- (NSDecimalNumber *(^)(NSDecimalNumber *))mul;
- (NSDecimalNumber *(^)(NSDecimalNumber *))div;

#pragma mark - 数值格式处理
- (NSDecimalNumber *(^)(id <NSDecimalNumberBehaviors>))behavior;



@end

NS_ASSUME_NONNULL_END
