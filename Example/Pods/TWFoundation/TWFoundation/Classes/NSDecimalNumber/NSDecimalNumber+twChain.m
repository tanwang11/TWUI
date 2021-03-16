//
//  NSDecimalNumber+twChain.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSDecimalNumber+twChain.h"

@implementation NSDecimalNumber (twChain)

- (NSDecimalNumber *(^)(NSDecimalNumber *))add {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByAdding:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))sub {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberBySubtracting:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))mul {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByMultiplyingBy:number];
    };
}

- (NSDecimalNumber *(^)(NSDecimalNumber *))div {
    return ^NSDecimalNumber *(NSDecimalNumber * number){
        return [self decimalNumberByDividingBy:number];
    };
}


/**
    调用示例 参数说明
 
    NSRoundPlain:四舍五入  NSRoundDown:向下取正   NSRoundUp:向上取正     NSRoundBankers:(特殊的四舍五入，碰到保留位数后一位的数字为5时，根据前一位的奇偶性决定。为偶时向下取正，为奇数时向上取正。如：1.25保留1为小数。5之前是2偶数向下取正1.2；1.35保留1位小数时。5之前为3奇数，向上取正1.4）
    scale:精确到几位小数
    raiseOnExactness:发生精确错误时是否抛出异常，一般为NO
    raiseOnOverflow:发生溢出错误时是否抛出异常，一般为NO
    raiseOnUnderflow:发生不足错误时是否抛出异常，一般为NO
    raiseOnDivideByZero:被0除时是否抛出异常，一般为YES
 
    NSDecimalNumber * inputNumber = [[NSDecimalNumber alloc]initWithString:@"340.0700001"];
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                    decimalNumberHandlerWithRoundingMode:NSRoundDown
                                    scale:2
                                    raiseOnExactness:NO
                                    raiseOnOverflow:NO
                                    raiseOnUnderflow:NO
                                    raiseOnDivideByZero:YES];
    NSDecimalNumber * number = [inputNumber decimalNumberByRoundingAccordingToBehavior: roundUp];
    NSLog(@"%@",number);
 */
- (NSDecimalNumber *(^)(id <NSDecimalNumberBehaviors>))behavior {
    return ^NSDecimalNumber *(id <NSDecimalNumberBehaviors> behaviors){
        return [self decimalNumberByRoundingAccordingToBehavior:behaviors];
    };
}

@end
