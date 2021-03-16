//
//  UITextField+twFormat.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITextField+twFormat.h"
#import "UITextField+twTextRange.h"
#import <CoreText/CoreText.h>
#import <TWFoundation/NSString+twTool.h>



@implementation UITextField (twFormat)

// 中国的电话
- (void)formatChinaPhone {
    [self formatChinaPhoneGapWidth:6];
}

- (void)formatChinaPhoneGapWidth:(int)gapWidth {
    UITextField * textField = self;
    if (textField.text.length == 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number = gapWidth; // gap宽度
            int length = 1;
            CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
            if (text.length > 3) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(2, length)];
            }
            if (text.length > 7) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(6, length)];
            }
            if (text.length > 11) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(10,length)];
            }
            
            CFRelease(num);
        }
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}

- (void)formatChinaIdcard {
    [self formatChinaIdcardGapWidth:6];
}

- (void)formatChinaIdcardGapWidth:(int)gapWidth {
    UITextField * textField = self;
    if (textField.text.length == 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number = gapWidth; // gap宽度
            int length = 1;
            CFNumberRef num = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
            if (text.length > 6) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(5, length)];
            }
            if (text.length > 10) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(9, length)];
            }
            if (text.length > 14) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(13, length)];
            }
            if (text.length > 18) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(17,length)];
            }
            
            CFRelease(num);
        }
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}

// money
- (void)formatMoneyUnit:(int)unit {
    [self formatMoneyUnit:unit gapWitdh:6];
}

- (void)formatMoneyUnit:(int)unit gapWitdh:(int)gapWidth {
    UITextField * textField = self;
    if (textField.text.length == 0) {
        return;
    }
    if (unit < 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    
    if ([textField.text hasPrefix:@"0"] && textField.text.length != 1){
        NSString * text = [textField.text replaceWithREG:@"^0+" newString:@""];
        if (text.length == 0) {
            textField.text = @"0";
        }else{
            textField.text = text;
        }
    }
    
    if ([textField.text hasPrefix:@"."] && textField.selectedRange.location != 0) {
        textField.text = [NSString stringWithFormat:@"0%@", textField.text];
    }
    
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        long number      = gapWidth; // gap宽度
        int length       = 1;
        //int unit         = 4;
        CFNumberRef num  = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
        
        NSString * textIntPart = [text stringWithREG:@"\\d+"]; // 去除整数部分
        int loopCountInt    = (int)(textIntPart.length-1)/(unit);
        int loopCountOrigin = (int)(text.length-1)/(unit);
        
        for (int i = 0, j=loopCountOrigin-1; i < loopCountInt; i++, j--) {
            NSInteger location = textIntPart.length - unit*i -1 - unit;
            NSRange attRange = NSMakeRange(location, length);
            if (location >= 0) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:attRange];
            }
        }
        
        CFRelease(num);
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}

- (void)formatBankUnit:(int)unit {
    [self formatBankUnit:unit gapWitdh:6];
}

- (void)formatBankUnit:(int)unit gapWitdh:(int)gapWidth {
    UITextField * textField = self;
    if (textField.text.length == 0) {
        return;
    }
    if (unit < 0) {
        return;
    }
    if (gapWidth < 0) {
        gapWidth = 0;
    }
    
    UITextRange *selectedTextRange = textField.selectedTextRange;
    
    NSString * text = textField.text;
    NSMutableAttributedString * attributedString;
    {
        attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        {
            long number      = gapWidth; // gap宽度
            int length       = 1;
            CFNumberRef num  = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&number);
            int loopCountInt = (int)(textField.text.length-1)/(unit);
            
            for (int i = 0; i<loopCountInt; i++) {
                [attributedString addAttribute:(id)kCTKernAttributeName value:(__bridge id)num range:NSMakeRange(unit*(i+1)-1, length)];
            }
            
            CFRelease(num);
        }
        [textField setAttributedText:attributedString];
    }
    
    [textField setSelectedTextRange:selectedTextRange];
}

@end
