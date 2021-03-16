//
//  UITableView+twTransitionCoordinator.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITableView+twTransitionCoordinator.h"

@implementation UITableView (twTransitionCoordinator)

- (void)transitionCoordinator:(id <UIViewControllerTransitionCoordinator>)transitionCoordinator animated:(BOOL)animated
{    
    NSIndexPath * ip = [self indexPathForSelectedRow];
    if (!ip) {
        return;
    }
    if (transitionCoordinator) {
        [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            [self deselectRowAtIndexPath:ip animated:animated];
            
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            if (context.isCancelled) {
                [self selectRowAtIndexPath:ip animated:animated scrollPosition:UITableViewScrollPositionNone];
            }
        }];
    }else{
        [self deselectRowAtIndexPath:ip animated:animated];
    }
}

@end
