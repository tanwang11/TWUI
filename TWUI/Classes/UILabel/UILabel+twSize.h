//
//  UILabel+twSize.h
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (twSize)

- (void)updateSize;
- (void)setSizeStr:(NSString *)text;
- (void)setSizeStr:(NSString *)text font:(UIFont *)font;
- (void)setSizeStr:(NSString *)text font:(UIFont *)font width:(float)width;
- (void)setSizeStr:(NSString *)text font:(UIFont *)font color:(UIColor *)color lineSpacing:(float)lineSpacing width:(float)width;


/*
 NSMutableAttributedString * att;
 
 att = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@%@%@%@", title, content1, content2, content3, content4]];
 
 NSRange range1 = (NSRange){0, title.length};
 NSRange range2 = (NSRange){NSMaxRange(range1), content1.length};
 NSRange range3 = (NSRange){NSMaxRange(range2), content2.length};
 NSRange range4 = (NSRange){NSMaxRange(range3), content3.length};
 NSRange range5 = (NSRange){NSMaxRange(range4), content4.length};
 
 NSRange contentRange = (NSRange){NSMaxRange(range1), NSMaxRange(range5) - range1.length};
 
 // 行间距
 NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
 paragraphStyle.lineSpacing=4;
 
 [att addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range2];
 [att addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range4];
 
 // font, 单独的换行可以稍微控制下距离
 [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:range1];
 [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:9 ] range:range2];
 [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range3];
 [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:9 ] range:range4];
 [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:range5];
 
 // color
 [att addAttribute:NSForegroundColorAttributeName value:ColorDarkGray  range:range1];
 [att addAttribute:NSForegroundColorAttributeName value:ColorLightGray range:contentRange];
 
 [oneL setSizeATT:att width:oneL.width];
 //*/
- (void)setSizeATT:(NSMutableAttributedString *)att;
- (void)setSizeATT:(NSMutableAttributedString *)att width:(float)width;

@end

NS_ASSUME_NONNULL_END
