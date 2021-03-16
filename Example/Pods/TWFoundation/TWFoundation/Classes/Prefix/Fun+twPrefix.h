//
//  Fun+twPrefix.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#ifndef Fun_twPrefix_h
#define Fun_twPrefix_h

#pragma mark - 异步执行
#ifndef dispatch_main_async_safe_sd
#define dispatch_main_async_safe_sd(block)\
if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}
#endif

#pragma mark - 标记开发状态
#ifndef __OPTIMIZE__
#define PIsDebugVersion                     YES
#else
#define PIsDebugVersion                     NO
#endif

#pragma mark - 特殊输入日志
#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)

#define NSLogSuccess(FORMAT, ...) NSLog(@"%s: %s", [@"✅" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogError(FORMAT, ...)   NSLog(@"%s: %s", [@"❌" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogWarm(FORMAT, ...)    NSLog(@"%s: %s", [@"⚠️" UTF8String], [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

// fprintf 和 printf 参数不一致
#define NSPrintInfo(FORMAT, ...) fprintf(stderr,"\n函数:%s 行:%d 内容:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#define NSLogInfo(FORMAT, ...)   NSLog(@"函数:%s 行:%d 内容:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])


//#define NSLogInfo1(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define NSLogInfo2(FORMAT, ...) printf("\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
//#define NSLog2(format, ...) printf("func:%s:\n%s\n---------------------\n\n", __PRETTY_FUNCTION__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

#define NSLogRect(rect)        NSLog(@"CGRect:%s \t= %@", #rect, NSStringFromCGRect(rect));
#define NSLogSize(size)        NSLog(@"CGSize:%s \t= %@", #size, NSStringFromCGSize(size));
#define NSLogPoint(point)    NSLog(@"CGPoint:%s \t= %@", #point, NSStringFromCGPoint(point));
#define NSLogRange(range)    NSLog(@"NSRange:%s \t= %@", #range, NSStringFromRange(range));

#else

#define NSLog(...) {}

#define NSLogSuccess(FORMAT, ...) {}
#define NSLogError(FORMAT, ...) {}
#define NSLogWarm(FORMAT, ...) {}

#define NSPrintInfo(FORMAT, ...) {}
#define NSLogInfo(FORMAT, ...) ()

#define NSLogRect(rect) {}
#define NSLogSize(size) {}
#define NSLogPoint(point) {}
#define NSLogRange(range) {}

#endif

#pragma mark - NSValue
//#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
#import <UIKit/UIKit.h>

#define NSValuePoint(point)         [NSValue valueWithCGPoint:point]
#define NSValueVector(vector)       [NSValue valueWithCGVector:vector]
#define NSValueSize(size)           [NSValue valueWithCGSize:size]
#define NSValueRect(rect)           [NSValue valueWithCGRect:rect]
#define NSValueTransform(transform) [NSValue valueWithCGAffineTransform:transform]
#define NSValueInsets(insets)       [NSValue valueWithUIEdgeInsets:insets]
#define NSValueOffset(insets)       [NSValue valueWithUIOffset:insets]

//#elif TARGET_OS_MAC
//#import <AppKit/AppKit.h>
//
//#endif

// --- 其他小函数 ----------------------------------------------------------------
#pragma mark - NSIndexPath
#undef  PIndexPath
#define PIndexPath(section, row)  [NSIndexPath indexPathForRow:row inSection:section]

#pragma mark - 图片
#undef  PImageNamed
#define PImageNamed(imageName)    [UIImage imageNamed:imageName]

#pragma mark - 设备型号
#define PIsIphoneDevice (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define PIsIpadDevice   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#endif /* Fun_twPrefix_h */
