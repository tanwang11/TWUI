//
//  NSString+twEmail.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString * const EmailRegStr = @"([a-z0-9A-Z_]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}";

@interface NSString (twEmail)

#pragma mark - 判断邮箱格式是否正确
- (BOOL)isValidateEmail;

@end

NS_ASSUME_NONNULL_END
