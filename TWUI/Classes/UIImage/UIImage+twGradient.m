//
//  UIImage+twGradient.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIImage+twGradient.h"

@implementation UIImage (twGradient)

/**
 *  获取矩形的渐变色的UIImage(此函数还不够完善)
 *
 *  @param bounds          UIImage的bounds
 *  @param colors          渐变色数组，可以设置两种颜色
 *  @param gradientHorizon 渐变的方式：0--->从上到下   1--->从左到右
 *
 *  @return 渐变色的UIImage
 */
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors gradientHorizon:(BOOL)gradientHorizon {
    CGPoint start;
    CGPoint end;
    
    if (gradientHorizon) {
        start = CGPointMake(0.0, 0.0);
        end = CGPointMake(bounds.size.width, 0.0);
    }else{
        start = CGPointMake(0.0, 0.0);
        end = CGPointMake(0.0, bounds.size.height);
    }
    
    UIImage *image = [self gradientImageWithBounds:bounds andColors:colors addStartPoint:start addEndPoint:end];
    return image;
}

+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors addStartPoint:(CGPoint)startPoint addEndPoint:(CGPoint)endPoint {
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(bounds.size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
