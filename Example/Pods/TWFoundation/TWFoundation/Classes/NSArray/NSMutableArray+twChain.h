//
//  NSMutableArray+twChain.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (twChain)

- (NSMutableArray *(^)(NSObject *))add;

- (NSMutableArray *(^)(NSArray *))adds;

@end

NS_ASSUME_NONNULL_END
