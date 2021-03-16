//
//  NSMutableArray+twChain.m
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "NSMutableArray+twChain.h"

@implementation NSMutableArray (twChain)

- (NSMutableArray *(^)(NSObject *))add {
    return ^NSMutableArray *(NSObject * object){
        [self addObject:object];
        return self;
    };
}

- (NSMutableArray *(^)(NSArray *))adds {
    return ^NSMutableArray *(NSArray * array){
        [self addObjectsFromArray:array];
        return self;
    };
}

@end
