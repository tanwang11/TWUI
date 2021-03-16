//
//  NSDecimalNumber+twSwizzling.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSDecimalNumber+twSwizzling.h"
#import "NSDecimalNumber+twChain.h"
#import "NSObject+twSwizzling.h"

@implementation NSDecimalNumber (twSwizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByAdding:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByAddingSafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberBySubtracting:withBehavior:)  bySwizzledSelector:@selector(decimalNumberBySubtractingSafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByMultiplyingBy:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByMultiplyingBySafe:withBehavior:)];
        [objc_getClass("NSDecimalNumber") methodSwizzlingWithOriginalSelector:@selector(decimalNumberByDividingBy:withBehavior:)  bySwizzledSelector:@selector(decimalNumberByDividingBySafe:withBehavior:)];
    });
}

- (NSDecimalNumber *)decimalNumberByAddingSafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior{
    
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByAddingSafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberBySubtractingSafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberBySubtractingSafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberByMultiplyingBySafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByMultiplyingBySafe:decimalNumber withBehavior:behavior];
    }
}

- (NSDecimalNumber *)decimalNumberByDividingBySafe:(NSDecimalNumber *)decimalNumber withBehavior:(nullable id <NSDecimalNumberBehaviors>)behavior {
    if ([self compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.notANumber] == NSOrderedSame || [decimalNumber compare:NSDecimalNumber.zero] == NSOrderedSame) {
        return NSDecimalNumber.notANumber;
    }else {
        return [self decimalNumberByDividingBySafe:decimalNumber withBehavior:behavior];
    }
}

@end
