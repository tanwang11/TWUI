//
//  UINavigationController+twRemove.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UINavigationController+twRemove.h"

@implementation UINavigationController (twRemove)

- (void)removeVcClass:(Class)vcClass animated:(BOOL)animated {
    NSArray * vcArray = self.viewControllers;
    if (vcArray.count > 1) {
        BOOL find = NO;
        NSMutableArray * uArray = [NSMutableArray new];
        for (UIViewController * vc in vcArray) {
            if ([vc isKindOfClass:vcClass]) {
                find = YES;
            }else{
                [uArray addObject:vc];
            }
        }
        if (find) {
            [self setViewControllers:uArray animated:animated];
        }
    }
}

/*
 index 如果是正数就从0开始,负数倒序开始.
 正:从0开始
 负:从-1开始
 */
- (void)removeIndex:(NSInteger)index animated:(BOOL)animated {
    NSMutableArray * vcArray = [self.viewControllers mutableCopy];
    if (vcArray.count > 1) {
        if (index >= 0) {
            if (index < vcArray.count) {
                [vcArray removeObjectAtIndex:index];
                [self setViewControllers:vcArray animated:animated];
            }
        }else{
            if (-index <= vcArray.count) {
                [vcArray removeObjectAtIndex:vcArray.count + index];
                [self setViewControllers:vcArray animated:animated];
            }
        }
    }
}

@end
