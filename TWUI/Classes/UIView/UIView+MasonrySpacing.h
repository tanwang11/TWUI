//
//  UIView+MasonrySpacing.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface UIView (MasonrySpacing)

- (void)masSpacingHorizontallyWith:(NSArray *)views;

- (void)masSpacingVerticallyWith:(NSArray *)views;

// -------------------------------------------------------------------------
// 下面是原先作者函数
- (void)distributeSpacingHorizontallyWith:(NSArray *)views;

- (void)distributeSpacingVerticallyWith:(NSArray *)views;

@end

NS_ASSUME_NONNULL_END
