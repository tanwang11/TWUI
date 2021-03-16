//
//  UIButton+twUIEdgeInsets.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TWEdgeInsetType) {
    TWEdgeInsetType_Top = 0,      //上
    TWEdgeInsetType_Left,         //左
    TWEdgeInsetType_Bottom,       //下
    TWEdgeInsetType_Right         //右
};


@interface UIButton (twUIEdgeInsets)

-(void)setEdgeInsetType:(TWEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap;

@end

NS_ASSUME_NONNULL_END
