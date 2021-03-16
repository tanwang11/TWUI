//
//  UITextField+twPlaceholder.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITextField+twPlaceholder.h"
#import <TWFoundation/NSObject+twSwizzling.h>


@implementation UITextField (twPlaceholder)

// http://www.cocoachina.com/articles/10783 :最下面修改默认文字颜色

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UITextField") methodSwizzlingWithOriginalSelector:@selector(drawPlaceholderInRect:) bySwizzledSelector:@selector(drawPlaceholderInRect_pPlaceholder:)];
    });
}


- (void)drawPlaceholderInRect_pPlaceholder:(CGRect)rect {
    [self drawPlaceholderInRect_pPlaceholder:rect];
    
    if (self.placeholderColor) {
        NSMutableParagraphStyle * paragraph = [NSMutableParagraphStyle new];
        paragraph.alignment     = self.textAlignment;//居中
        paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
        
        NSDictionary* attrs =
        @{NSFontAttributeName:self.font,
          NSForegroundColorAttributeName:self.placeholderColor,
          NSParagraphStyleAttributeName:paragraph,//段落格式
          };
        
        [self.placeholder drawInRect:rect withAttributes:attrs];
    }
    
}

#pragma mark - set get
- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, @"placeholderColor");
}

@end
