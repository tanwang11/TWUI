//
//  UINavigationController+twSize.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UINavigationController+twSize.h"
#import <objc/runtime.h>

@implementation UINavigationController (twSize)

@dynamic topMargin;
@dynamic _initTopMargin;

- (int)fetchTopMargin {
    int top;
    if (self.navigationBar.translucent) {
        //self.navigationItem.
        if (@available(iOS 11.0, *)) {
            UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
            if (mainWindow.safeAreaInsets.top > 20.0) {
                top = self.navigationBar.frame.size.height + mainWindow.safeAreaInsets.top;
            }else{
                top = 64;
            }
            
        }else{
            top = 64;
        }
    }else{
        top = 0;
    }
    self.topMargin = top;
    return top;
}

- (void)setTopMargin:(int)topMargin {
    objc_setAssociatedObject(self, @"topMargin", @(topMargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)topMargin {
    if (self._initTopMargin) {
        NSNumber * n = objc_getAssociatedObject(self, @"topMargin");
        return n.intValue;
    }else{
        self._initTopMargin = YES;
        int top = [self fetchTopMargin];
        [self setTopMargin:top];
        return top;
    }
}

- (void)set_initTopMargin:(BOOL)_initTopMargin {
    objc_setAssociatedObject(self, @"_initTopMargin", @(_initTopMargin), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)_initTopMargin {
    NSNumber * n = objc_getAssociatedObject(self, @"_initTopMargin");
    return n.boolValue;
}

@end
