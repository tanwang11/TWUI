//
//  UITextField+twMaxLength.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (twMaxLength)

// 这个需要手动移除
+ (void)addNormalDidChangeNCTarget:(id)target action:(SEL)action;
+ (void)removeDidChangeNCTarget:(id)target;

- (void)textFieldMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock;

@end

NS_ASSUME_NONNULL_END
