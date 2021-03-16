//
//  Block+twPrefix.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>


#ifndef Block_twPrefix_h
#define Block_twPrefix_h

// 定义
// 返回为空
typedef void(^BlockPVoid)             (void);
typedef void(^BlockPInt)              (int number);
typedef void(^BlockPInteger)          (NSInteger number);
typedef void(^BlockPFloat)            (CGFloat number);
typedef void(^BlockPBool)             (BOOL value);
typedef void(^BlockPString)           (NSString * string);
typedef void(^BlockPDic)              (NSDictionary * dic);
typedef void(^BlockPData)             (NSData * data);
typedef void(^BlockPArray)            (NSArray * array);
typedef void(^BlockPMArray)           (NSMutableArray * array);

typedef void(^BlockPID)               (id sender);

//#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#import <UIKit/UIKit.h>
typedef void(^BlockPButton)           (UIButton * bt);
typedef void(^BlockPView)             (UIView * view);
typedef void(^BlockPImageView)        (UIImageView * iv);
typedef void(^BlockPViewController)   (UIViewController * vc);
//
//#elif TARGET_OS_MAC
//#import <AppKit/AppKit.h>
//typedef void(^BlockPButton)           (NSButton * bt);
//typedef void(^BlockPView)             (NSView * view);
//typedef void(^BlockPImageView)        (NSImageView * iv);
//typedef void(^BlockPViewController)   (NSViewController * vc);


#endif /* Block_twPrefix_h */
