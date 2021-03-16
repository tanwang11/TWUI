//
//  UIResponder+twRouter.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIResponder+twRouter.h"

@implementation UIResponder (twRouter)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    // NSLog(@"nextResponder : %@", [self nextResponder]);
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
