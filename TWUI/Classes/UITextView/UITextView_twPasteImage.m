//
//  UITextView_twPasteImage.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITextView_twPasteImage.h"

@implementation UITextView_twPasteImage

- (void)paste:(id)sender
{
    BOOL isHasImage = [[UIPasteboard generalPasteboard] containsPasteboardTypes:UIPasteboardTypeListImage];
    if (isHasImage) {
        if (self.pasteImageDelegate && [self.pasteImageDelegate respondsToSelector:@selector(textView:pasteImage:)]) {
            [self.pasteImageDelegate textView:self pasteImage:[UIPasteboard generalPasteboard].image];
        }
    } else{
        [super paste:sender];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (self.overrideNextResponder){
        return NO;
    }else if (action == @selector(paste:) && [UIPasteboard generalPasteboard].image){
        return YES;
    }else{
        return [super canPerformAction:action withSender:sender];
    }
}

// 在firstResponse的情况下,为了显示UIMenuController,也不丢失firstResponse.
// demo原来写法.
//- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    if (self.overrideNextResponder != nil)
//        return NO;
//    else
//        return [super canPerformAction:action withSender:sender];
//}

- (UIResponder *)nextResponder
{
    if (self.overrideNextResponder){
        return self.overrideNextResponder;
    } else {
        return [super nextResponder];
    }
}

@end
