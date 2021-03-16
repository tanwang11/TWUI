//
//  Color+twPrefix.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

#ifndef Color_twPrefix_h
#define Color_twPrefix_h

CG_INLINE UIColor * PRGBF(float R, float G, float B, float F) {
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:F];
};

// need:UIKit,CoreGraphics
CG_INLINE UIColor * PRGB16(unsigned long rgbValue) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
};

CG_INLINE UIColor * PRGB16F(unsigned long rgbValue, float F) {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:F];
};


//------------------------------------------------------------------------------
// 常用的色
#define PColorBlack     [UIColor blackColor]
#define PColorBlackC    PRGB16(0XCCCCCC)
#define PColorBlackE    PRGB16(0XEEEEEE)
#define PColorBlack0    [UIColor blackColor]
#define PColorBlack3    PRGB16(0X333333)
#define PColorBlack6    PRGB16(0X666666)
#define PColorBlack9    PRGB16(0X999999)
#define PColorWhite     [UIColor whiteColor]
#define PColorClear     [UIColor clearColor]
#define PColorTVBG      PRGBF(240, 240, 240, 1)



#endif /* Color_twPrefix_h */
