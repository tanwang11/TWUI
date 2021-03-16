//
//  UIImage+twGradient.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (twGradient)

// 渐变色
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors gradientHorizon:(BOOL)gradientHorizon;
+ (UIImage*)gradientImageWithBounds:(CGRect)bounds andColors:(NSArray*)colors addStartPoint:(CGPoint)startPoint addEndPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END
