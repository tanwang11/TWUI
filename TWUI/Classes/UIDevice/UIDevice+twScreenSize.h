//
//  UIDevice+twScreenSize.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (twScreenSize)

// 是否是刘海屏幕,通过安全区域取值
+ (BOOL)isIphoneXScreen;

// 获取 系统statusBar Height
+ (int)statusBarHeight;

/** iphoneX 底部安全距离 */
+ (CGFloat)safeBottomMargin;

@end

NS_ASSUME_NONNULL_END
