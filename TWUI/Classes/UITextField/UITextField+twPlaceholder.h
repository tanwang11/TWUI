//
//  UITextField+twPlaceholder.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (twPlaceholder)

// 需要优先设置: font、textalignment;
// 如果为空,则用默认值.
@property (nonatomic, strong) UIColor * placeholderColor;

@end

NS_ASSUME_NONNULL_END
