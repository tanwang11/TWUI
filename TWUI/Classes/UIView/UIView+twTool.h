//
//  UIView+twTool.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (twTool)

#pragma mark 自带延迟效果的remove函数,防止自己销毁自己出错的情况.
+ (void)removeDestroyView:(UIView *)oneView;

@end

NS_ASSUME_NONNULL_END
