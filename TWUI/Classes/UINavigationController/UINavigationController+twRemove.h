//
//  UINavigationController+twRemove.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (twRemove)

- (void)removeVcClass:(Class)vcClass animated:(BOOL)animated;

/*
 index 如果是正数就从0开始,负数倒序开始.
 正:从0开始
 负:从-1开始
 */
- (void)removeIndex:(NSInteger)index animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
