//
//  UIButton+pLayoutCustom.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef CGRect(^Block_pLayoutCustom_frame) (UIButton * button, CGRect contentRect);

@interface UIButton (pLayoutCustom)

@end

NS_ASSUME_NONNULL_END
