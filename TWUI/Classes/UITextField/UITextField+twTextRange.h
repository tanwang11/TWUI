//
//  UITextField+twTextRange.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (twTextRange)

- (NSRange)selectedRange;
- (void)setSelectedRange:(NSRange) range;

@end

NS_ASSUME_NONNULL_END
