//
//  UIViewController+twNcBar.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIViewController+twNcBar.h"
#import <objc/runtime.h>

@implementation UIViewController (twNcBar)
@dynamic hiddenNcBar;

- (void)setHiddenNcBar:(BOOL)hiddenNcBar {
    objc_setAssociatedObject(self, @"hiddenNcBar", @(hiddenNcBar), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hiddenNcBar {
    NSNumber * n = objc_getAssociatedObject(self, @"hiddenNcBar");
    return n.boolValue;
}

- (BOOL)isInNC {
    for (UIViewController * vc in self.navigationController.viewControllers) {
        if (vc == self) {
            return YES;
        }
    }
    return NO;
}

@end
