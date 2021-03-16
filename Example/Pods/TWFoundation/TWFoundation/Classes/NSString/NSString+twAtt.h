//
//  NSString+twAtt.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (twAtt)

+ (NSMutableAttributedString *)underLineAttString:(NSString * _Nullable)string font:(UIFont * _Nullable)font color:(UIColor * _Nullable)color;

@end



@interface NSMutableAttributedString (pAtt)

- (void)addString:(NSString * _Nullable)string font:(UIFont * _Nullable)font color:(UIColor * _Nullable)color;

- (void)addString:(NSString * _Nullable)string font:(UIFont * _Nullable)font color:(UIColor * _Nullable)color underline:(BOOL)isUnderLine;

- (void)addString:(NSString * _Nullable)string font:(UIFont * _Nullable)font color:(UIColor * _Nullable)color bgColor:(UIColor * _Nullable)bgColor underline:(BOOL)isUnderLine;

- (void)addString:(NSString * _Nullable)string font:(UIFont * _Nullable)font color:(UIColor * _Nullable)color bgColor:(UIColor * _Nullable)bgColor underline:(BOOL)isUnderLine lineSpacing:(float)lineSpacing textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

// 用于纠正不同字体之间的文字,不会行居中的问题
- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range;
- (void)setBaselineOffsetMaxFont:(float)maxFont miniFont:(float)miniFont range:(NSRange)range scale:(float)scale;

//#pragma mark - Size Department
//- (CGSize)sizeWithWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
