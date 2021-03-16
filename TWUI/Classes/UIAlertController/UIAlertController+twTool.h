//
//  UIAlertController+twTool.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (twTool)

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler;

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelTitle:(nullable NSString *)cancelTitle
  cancelHandel:(void (^ __nullable)(UIAlertAction *action))cancelHandler
    otherTitle:(nullable NSString *)otherTitle
   otherHandel:(void (^ __nullable)(UIAlertAction *action))otherHandler;

+ (void)showAt:(nonnull UIViewController *)vc
         style:(UIAlertControllerStyle)style
         title:(nullable NSString *)title
       message:(nullable NSString *)message
   cancelAlert:(nullable UIAlertAction *)cancelAlert
    otherAlert:(nullable UIAlertAction *)otherAlert, ... NS_REQUIRES_NIL_TERMINATION;


@end

NS_ASSUME_NONNULL_END
