//
//  NSObject+twAssiign.h
//  TWTool_Example
//
//  Created by TW on 2021/3/8.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (twAssiign)

- (void)assignInt:(int)intValue string:(NSString * _Nullable)string;

// 假如某个string为null或者"", 那么设置为 value
- (void)assignNilString:(NSString * _Nullable)strValue;

- (void)assignIncreaseValue;


@end

NS_ASSUME_NONNULL_END
