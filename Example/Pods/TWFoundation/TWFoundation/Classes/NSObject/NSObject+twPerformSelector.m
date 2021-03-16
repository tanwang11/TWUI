//
//  NSObject+twPerformSelector.m
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSObject+twPerformSelector.h"
#import <objc/runtime.h>


@implementation NSObject (twPerformSelector)


+ (void)target:(id)target voidAction:(SEL)action {
    if (!target) { return; }
    IMP imp = [target methodForSelector:action];
    void (*func)(id, SEL) = (void *)imp;
    func(target, action);
}

//// 带参数的和返回值的
//+ (void)target1:(id)target action:(SEL)action {
//    SEL selector = NSSelectorFromString(@"processRegion:ofView:");
//    IMP imp = [target methodForSelector:selector];
//    CGRect (*func)(id, SEL, CGRect, UIView *) = (void *)imp;
//    CGRect result = target ? func(target, selector, someRect, someView) : CGRectZero;
//}

@end
