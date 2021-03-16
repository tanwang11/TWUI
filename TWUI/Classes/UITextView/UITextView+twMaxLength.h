//
//  UITextView+twMaxLength.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (twMaxLength)

+ (void)addDidChangeNCTarget:(id)target action:(SEL)action;
+ (void)removeDidChangeNCTarget:(id)target;

//- (void)textViewDidChanged:(NSNotification *)dic
//{
//    UITextView * textView = (UITextView *)dic.object;
//    [textView textViewMaxLength:MaxNoteTextLength block:^(BOOL isEditing, BOOL isOutRange) {
//        if (isEditing) {
//            // DoNothing
//        }else{
//            if (isOutRange) {
//                self.noteMaxWordL.text = [NSString stringWithFormat:@"%i/%i", MaxNoteTextLength, MaxNoteTextLength];
//                AlertToastTitle(@"字数已达上限");
//            }else{
//                self.noteMaxWordL.text = [NSString stringWithFormat:@"%i/%i", (int)textView.text.length, MaxNoteTextLength];
//            }
//        }
//    }];
//}

- (void)textViewMaxLength:(int)maxLength block:(void(^)(BOOL isEditing, BOOL isOutRange))textFieldBlock;

@end

NS_ASSUME_NONNULL_END
