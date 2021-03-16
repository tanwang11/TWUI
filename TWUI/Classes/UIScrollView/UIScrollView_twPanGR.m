//
//  UIScrollView_twPanGR.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIScrollView_twPanGR.h"

@implementation UIScrollView_twPanGR

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (id)init {
    if (self = [super init]) {
        self.directionalLockEnabled = YES;
    }
    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // 前提条件
    // self.commentSV.directionalLockEnabled = YES;
    
    if ([otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]] ) {
        return YES;
    }else{
        return NO;
    }
}

@end
