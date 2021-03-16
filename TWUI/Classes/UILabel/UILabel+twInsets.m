//
//  UILabel+twInsets.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UILabel+twInsets.h"
#import <TWFoundation/NSObject+twSwizzling.h>


@implementation UILabel (twInsets)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("UILabel") methodSwizzlingWithOriginalSelector:@selector(drawTextInRect:) bySwizzledSelector:@selector(drawTextInRect_pInsets:)];
    });
}


- (void)drawTextInRect_pInsets:(CGRect)rect {
    if (UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, self.insets)) {
        [self drawTextInRect_pInsets:rect];
    } else {
        [self drawTextInRect_pInsets:UIEdgeInsetsInsetRect(rect, self.insets)];
    }
}

#pragma mark - set get
- (void)setInsets:(UIEdgeInsets)insets {
    objc_setAssociatedObject(self, @"insets", NSStringFromUIEdgeInsets(insets), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)insets {
    NSString * str = objc_getAssociatedObject(self, @"insets");
    if (str) {
        return UIEdgeInsetsFromString(str);
    } else {
        return UIEdgeInsetsZero;
    }
}

@end
