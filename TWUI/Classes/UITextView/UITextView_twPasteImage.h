//
//  UITextView_twPasteImage.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UITextView_twPasteImageDelegate <NSObject>

- (void)textView:(UITextView *)textView pasteImage:(UIImage *)image;

@end


@interface UITextView_twPasteImage : UITextView

@property (nonatomic, weak  ) id <UITextView_twPasteImageDelegate> pasteImageDelegate;

// 在firstResponse的情况下,为了显示UIMenuController,也不丢失firstResponse.
// http://stackoverflow.com/questions/8380373/showing-uimenucontroller-loses-keyboard
@property (nonatomic, weak  ) UIResponder *overrideNextResponder;

@end

NS_ASSUME_NONNULL_END
