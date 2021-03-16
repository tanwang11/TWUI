//
//  ProgressView_tanwang.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "ProgressView_tanwang.h"

#define UIColorMake(r, g, b, a) [UIColor colorWithRed:r / 255. green:g / 255. blue:b / 255. alpha:a]

@interface ProgressView_tanwang ()
@property(nonatomic) CGFloat progress;
@end


@implementation ProgressView_tanwang

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupParams];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupParams];
    }

    return self;
}

- (void)setupParams {
    self.backgroundColor = [UIColor clearColor];

    self.frameWidth = 3;
    self.progressColor = UIColorMake(44, 103, 175, 1);
    self.progressBackgroundColor = UIColorMake(190, 223, 244, 1);
    self.circleBackgroundColor = [UIColor whiteColor];
}

- (void)setCurrentProgress:(CGFloat)progress
{
    progress = MAX(progress, 0.01);
    self.progress = progress;
    [self setNeedsDisplay];
}

#pragma mark draw progress
- (void)drawRect:(CGRect)rect {
    [self drawFillPie:rect margin:0 color:self.circleBackgroundColor percentage:1];
    [self drawFramePie:rect];
    [self drawFillPie:rect margin:self.frameWidth color:self.progressBackgroundColor percentage:1];
    [self drawFillPie:rect margin:self.frameWidth color:self.progressColor percentage:self.progress];
}

- (void)drawFillPie:(CGRect)rect margin:(CGFloat)margin color:(UIColor *)color percentage:(CGFloat)percentage {
    CGFloat radius = MIN(CGRectGetHeight(rect), CGRectGetWidth(rect)) * 0.5 - margin;
    CGFloat centerX = CGRectGetWidth(rect) * 0.5;
    CGFloat centerY = CGRectGetHeight(rect) * 0.5;

    CGContextRef cgContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(cgContext, [color CGColor]);
    CGContextMoveToPoint(cgContext, centerX, centerY);
    CGContextAddArc(cgContext, centerX, centerY, radius, (CGFloat) -M_PI_2, (CGFloat) (-M_PI_2 + M_PI * 2 * percentage), 0);
    CGContextClosePath(cgContext);
    CGContextFillPath(cgContext);
}

- (void)drawFramePie:(CGRect)rect {
    CGFloat radius = MIN(CGRectGetHeight(rect), CGRectGetWidth(rect)) * 0.5;
    CGFloat centerX = CGRectGetWidth(rect) * 0.5;
    CGFloat centerY = CGRectGetHeight(rect) * 0.5;

    [UIColorMake(155, 190, 225, 0.8) set];
    CGFloat fw = self.frameWidth + 1;
    CGRect frameRect = CGRectMake(
            centerX - radius + fw,
            centerY - radius + fw,
            (radius - fw) * 2,
            (radius - fw) * 2);
    UIBezierPath *insideFrame = [UIBezierPath bezierPathWithOvalInRect:frameRect];
    insideFrame.lineWidth = 2;
    [insideFrame stroke];
}

@end
