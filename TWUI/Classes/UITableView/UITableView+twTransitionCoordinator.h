//
//  UITableView+twTransitionCoordinator.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (twTransitionCoordinator)

/*
 缓慢侧滑的时候,cell缓慢变色的特效,可以查看系统设置效果.
 借鉴于: https://juejin.im/post/5c26dfe851882561431a4927
 https://github.com/popor/DeselectRowTheBestWay
 
//*/
- (void)transitionCoordinator:(id <UIViewControllerTransitionCoordinator>)transitionCoordinator animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
