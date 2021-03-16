//
//  UITextView_twPlaceHolder.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
//IB_DESIGNABLE 让你的自定 UIView 可以在 IB 中预览。
//IBInspectable 让你的自定义 UIView 的属性出现在 IB 中 Attributes inspector 。


@interface UITextView_twPlaceHolder : UITextView

@property (nonatomic, retain) IBInspectable NSString * placeholder;
@property (nonatomic, retain) IBInspectable UIColor  * placeholderColor;

@property (nonatomic, strong) UILabel * placeHolderLabel;
@property (nonatomic        ) CGPoint placeHolderOrigin;

-(void)textChanged:(NSNotification* _Nullable)notification;

@end

NS_ASSUME_NONNULL_END
