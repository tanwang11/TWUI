//
//  UIImage+twRead.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage_twRead : UIView

+ (NSString *)absoPathInBundleResource:(NSString *)fileName;// 只用下一个就足够了.
+ (UIImage *)imageWithImageName:(NSString *)imageName;
+ (UIImage *)imageWithAbsImageFile:(NSString *)absImageFile;

@end

NS_ASSUME_NONNULL_END
