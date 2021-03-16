//
//  UIImage+twRead.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIImage+twRead.h"

@implementation UIImage_twRead

+ (NSString *)absoPathInBundleResource:(NSString *)fileName {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
}

+ (UIImage *)imageWithImageName:(NSString *)imageName {
    return [UIImage imageWithContentsOfFile:[self absoPathInBundleResource:imageName]];
}

+ (UIImage *)imageWithAbsImageFile:(NSString *)absImageFile {
    UIImage * image = [UIImage imageWithContentsOfFile:absImageFile];
    if (image.imageOrientation != UIImageOrientationUp) {
        image=[UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationUp];
    }
    return image;
}

@end
