//
//  UIView+twTool.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIView+twTool.h"

@implementation UIView (twTool)

#pragma mark 自带延迟效果的remove函数,防止自己销毁自己出错的情况.
+ (void)removeDestroyView:(UIView *)oneView
{
    __block UIView * weakView = oneView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [oneView removeFromSuperview];
        weakView = nil;
    });
}

@end
