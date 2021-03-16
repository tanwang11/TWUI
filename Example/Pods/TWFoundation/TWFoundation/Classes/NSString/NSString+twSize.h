//
//  NSString+twSize.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (twSize)

- (CGSize)sizeInFont:(UIFont * _Nonnull)font;

- (CGSize)sizeInFont:(UIFont * _Nonnull)font width:(float)width;

- (CGSize)sizeAttrSpace:(CGFloat)lineSpeace withFont:(UIFont * _Nonnull)font withWidth:(CGFloat)width;


@end

NS_ASSUME_NONNULL_END
