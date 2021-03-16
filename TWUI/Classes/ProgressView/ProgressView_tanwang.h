//
//  ProgressView_tanwang.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProgressView_tanwang : UIView

@property(nonatomic        ) CGFloat   frameWidth;
@property(nonatomic, strong) UIColor * progressColor;
@property(nonatomic, strong) UIColor * progressBackgroundColor;
@property(nonatomic, strong) UIColor * circleBackgroundColor;

- (void)setCurrentProgress:(CGFloat)progress;

@end

NS_ASSUME_NONNULL_END
