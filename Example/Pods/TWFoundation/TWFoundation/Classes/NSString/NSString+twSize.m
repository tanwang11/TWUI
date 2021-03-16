//
//  NSString+twSize.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSString+twSize.h"

@implementation NSString (twSize)

- (CGSize)sizeInFont:(UIFont * _Nonnull)font{
    if (!self || self.length==0 || !font) {
        return CGSizeZero;
    }
    
    NSDictionary * attributes = @{NSFontAttributeName : font};
    CGSize contentSize=[self sizeWithAttributes:attributes];
    /**
     ceil
     返回大于或等于指定的十进制数的最小整数
     */
    contentSize = CGSizeMake(ceil(contentSize.width), ceil(contentSize.height));
    
    return contentSize;
}

- (CGSize)sizeInFont:(UIFont * _Nonnull)font width:(float)width {
    if (!self || self.length==0 || !font) {
        return CGSizeZero;
    }
    
    CGSize size = CGSizeMake(width, 200000.0f);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    
    // UI系列
//#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
    size =[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    size = CGSizeMake(ceil(size.width), ceil(size.height));
    return size;
    // NS系列
//#elif TARGET_OS_MAC
//
//    if (@available(macOS 10.11, *)) {
//        size =[self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
//        size = CGSizeMake(ceil(size.width), ceil(size.height));
//        return size;
//    } else {
//        NSLog(@"10.11之前的系统不支持该方法: %s", __func__);
//        return CGSizeZero;
//    }
//#endif
    
}

-(CGSize)sizeAttrSpace:(CGFloat)lineSpeace withFont:(UIFont * _Nonnull)font withWidth:(CGFloat)width {
    if (!self || self.length==0 || !font) {
        return CGSizeZero;
    }
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self];
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    //    paraStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paraStyle.lineSpacing = lineSpeace;
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle};
    
    [attr addAttributes:dic range:NSMakeRange(0, self.length)];
    
    // UI系列
//#if TARGET_OS_IOS || TARGET_OS_TV || TARGET_OS_WATCH
    CGSize size = [attr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine context:nil].size;
    size = CGSizeMake(ceil(size.width), ceil(size.height));
    return size;
    
    // NS系列
//#elif TARGET_OS_MAC
//    if (@available(macOS 10.11, *)) {
//        CGSize size = [attr boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine context:nil].size;
//        size = CGSizeMake(ceil(size.width), ceil(size.height));
//        return size;
//    } else {
//        // Fallback on earlier versions
//        NSLog(@"10.11之前的系统不支持该方法: %s", __func__);
//        return CGSizeZero;
//    }
//#endif
    
}

@end
