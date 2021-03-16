//
//  UIViewController+twAC.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIViewController+twAC.h"

#import <TWFoundation/NSObject+twSwizzling.h>
#import <TWFoundation/Fun+twPrefix.h>

@implementation UIViewController (twAC)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self methodSwizzlingWithOriginalSelector:@selector(presentViewController:animated:completion:) bySwizzledSelector:@selector(safePresentViewController:animated:completion:)];
    });
}

- (void)safePresentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        UIAlertController * ac = (UIAlertController *)viewControllerToPresent;
        if (ac.preferredStyle == UIAlertControllerStyleActionSheet) {
            if (PIsIpadDevice) {
                UIPopoverPresentationController *popPresenter = [ac popoverPresentationController];
                if (!popPresenter.sourceView) {
                    popPresenter.sourceView = self.view;
                    popPresenter.sourceRect = CGRectMake(self.view.bounds.size.width/2, self.view.bounds.size.height - 50, 1, 1);
                }
            }
        }
    }
    
    [self safePresentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end
