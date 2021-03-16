//
//  UIViewController+twTapEndEdit.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (twTapEndEdit)

@property (nonatomic, strong) UITapGestureRecognizer  * tapEndEditGR;

- (void)addTapEndEditGRAction;
- (void)startMonitorTapEdit;
- (void)stopMonitorTapEdit;

// 回调
- (void)keyboardFrameChanged:(CGRect)rect duration:(CGFloat)duration show:(BOOL)show;

@end

NS_ASSUME_NONNULL_END
