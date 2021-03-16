//
//  UITextView+twSize.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (twSize)

#pragma mark - 获得TextView所需高度
- (CGFloat)sizeInWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
