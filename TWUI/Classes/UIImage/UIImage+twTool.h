//
//  UIImage+twTool.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (twTool)

#pragma mark - 或许模仿苹果聊天的背景图片
+ (UIImage *)stretchableImage:(UIImage *)image orient:(UIImageOrientation)direction point:(CGPoint)point;

+ (NSString *)getAppLaunchImage;

/*
 作者：ITCodeShare
 链接：https://www.jianshu.com/p/99c3e6a6c033
 來源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */
#pragma mark - 图片压缩
- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;

@end

NS_ASSUME_NONNULL_END
