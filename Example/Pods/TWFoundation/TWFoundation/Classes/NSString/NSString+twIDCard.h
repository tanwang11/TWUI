//
//  NSString+twIDCard.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (twIDCard)

- (BOOL)isChinaIdCardNoLength;
- (BOOL)isChinaIdCardNo;

- (NSString *)chinaIdcardLastCode;

@end

NS_ASSUME_NONNULL_END
