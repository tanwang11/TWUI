//
//  UIViewController+twNcBar.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (twNcBar)

@property (nonatomic) BOOL hiddenNcBar;// 隐藏导航栏的视图

- (BOOL)isInNC;

@end


NS_ASSUME_NONNULL_END
