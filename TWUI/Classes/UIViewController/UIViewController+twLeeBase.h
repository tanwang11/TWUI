//
//  UIViewController+twLeeBase.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (twLeeBase)

- (UIBarButtonItem *)loadLeftItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (UIBarButtonItem *)loadRightItemWithImage:(UIImage *)image target:(id)target action:(SEL)action;

- (UIBarButtonItem *)loadLeftItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (UIBarButtonItem *)loadRightItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (UIBarButtonItem *)loadLeftItemWithTitle:(NSString *)title color:(UIColor *)titleColor target:(id)target action:(SEL)action;
- (UIBarButtonItem *)loadRightItemWithTitle:(NSString *)title color:(UIColor *)titleColor target:(id)target action:(SEL)action;

- (UIBarButtonItem *)itemWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title titleColor:(UIColor * _Nullable)titleColor target:(id)target action:(SEL)action isLeft:(BOOL)isLeft;

//- (void)loadWxChatVCLeftItemWithTitle:(NSString *)title action:(SEL)action;

- (void)loadItemWithFirstImage:(UIImage *)image1 firstAction:(SEL)action1
                   secondImage:(UIImage *)image2 secondAction:(SEL)action2
                        target:(id)target
                          left:(BOOL)isLeft;

#pragma mark - 返回方法
- (void)twVC_leeBase;

@end

NS_ASSUME_NONNULL_END
