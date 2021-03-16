//
//  IToastTWTool.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IToast_tanwang.h"

NS_ASSUME_NONNULL_BEGIN

/*
 会根据键盘的高度自动调整吐司位置.
 */

#define AlertToastTitle(title)                       [IToastTWTool alertTitle:title duration:0    copy:NO]
#define AlertToastTitleTime(title, time)             [IToastTWTool alertTitle:title duration:time copy:NO]
#define AlertToastTitleTimeCopy(title, time, isCopy) [IToastTWTool alertTitle:title duration:time copy:isCopy]



@interface IToastTWTool : NSObject

// 需要在APP启动之前就增加
+ (IToastTWTool *)share;

@property (nonatomic        ) int keyboardH;

+ (void)alertTitle:(NSString *)title;
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration;

/*
 if (duration == 0 || duration == -1) {
 duration = 2;
 }
 //*/
+ (void)alertTitle:(NSString *)title duration:(NSInteger)duration copy:(BOOL)copy;


@end

NS_ASSUME_NONNULL_END
