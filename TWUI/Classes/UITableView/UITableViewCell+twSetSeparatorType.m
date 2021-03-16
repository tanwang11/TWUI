//
//  UITableViewCell+twSetSeparatorType.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UITableViewCell+twSetSeparatorType.h"

@implementation UITableViewCell (twSetSeparatorType)

- (void)setSeparatorX:(float)x
{
    /* first
     {
     // 初始化
     if ([self.infoTV respondsToSelector:@selector(setSeparatorInset:)]) {
     [self.infoTV setSeparatorInset:UIEdgeInsetsZero];
     }
     if ([self.infoTV respondsToSelector:@selector(setLayoutMargins:)]) {
     [self.infoTV setLayoutMargins:UIEdgeInsetsZero];
     }
     }
     second
     -(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
     {
     [cell setSeparatorX:1];
     }
     
     //*/
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        [self setSeparatorInset:UIEdgeInsetsMake(0, x, 0, 0)];
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        [self setLayoutMargins:UIEdgeInsetsMake(0, x, 0, 0)];
    }
}

@end
