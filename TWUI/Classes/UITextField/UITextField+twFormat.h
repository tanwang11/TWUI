//
//  UITextField+twFormat.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (twFormat)

// gapWidth 默认为:6

// 中国的电话, 格式为3-4-4
- (void)formatChinaPhone;
- (void)formatChinaPhoneGapWidth:(int)gapWidth;

- (void)formatChinaIdcard;
- (void)formatChinaIdcardGapWidth:(int)gapWidth;

// money, unit 一般为3或者4
- (void)formatMoneyUnit:(int)unit;
- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth;

// bank, unit 一般为4
- (void)formatBankUnit:(int)unit;
- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth;

@end

NS_ASSUME_NONNULL_END
