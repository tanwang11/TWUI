//
//  UIImage+twSave.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (twSave)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath;

@end

NS_ASSUME_NONNULL_END
