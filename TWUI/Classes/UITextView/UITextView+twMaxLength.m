//
//  UITextView+twMaxLength.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITextView+twMaxLength.h"

@implementation UITextView (twMaxLength)

+ (void)addDidChangeNCTarget:(id)target action:(SEL)action
{
    [[NSNotificationCenter defaultCenter] addObserver:target selector:action name:UITextViewTextDidChangeNotification object:nil];
}

+ (void)removeDidChangeNCTarget:(id)target
{
    [[NSNotificationCenter defaultCenter] removeObserver:target name:UITextViewTextDidChangeNotification object:nil];
}

- (void)textViewMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self delayML:maxLength block:textFieldBlock];
    });
}

- (void)delayML:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock
{
    NSString *toBeString = self.text;
    
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position   = [self positionFromPosition:selectedRange.start offset:0];
    //NSLog(@"1 selectedRange: %@", selectedRange.description);
    //NSLog(@"1.1 selectedRange: %i", selectedRange.isEmpty);
    //NSLog(@"2 position     : %@", position.description);
    
    // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
    if (position) {
        // NSLog(@"输入中");
        textFieldBlock(YES, NO);
    }else{
        if (toBeString.length > maxLength) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1){
                // 最后结尾普通字体的话
                self.text = [toBeString substringToIndex:maxLength];
                // NSLog(@"越界 普通结尾");
            }else{
                // 最后结尾是表情的话
                // NSLog(@"越界 表情结尾");
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength)];
                self.text = [toBeString substringWithRange:rangeRange];
            }
            textFieldBlock(NO, YES);
        }else{
            // NSLog(@"正常");
            textFieldBlock(NO, NO);
        }
    }
}

@end
