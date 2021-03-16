//
//  UIButton+twUIEdgeInsets.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIButton+twUIEdgeInsets.h"
#import <TWFoundation/NSString+twSize.h>
#import "UIView+twExtension.h"


@implementation UIButton (twUIEdgeInsets)

-(void)setEdgeInsetType:(TWEdgeInsetType)edgeInsetType spaceGap:(CGFloat)spaceGap{
    
    CGFloat space = spaceGap;
    
    CGFloat imageWith   = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGSize size = [self.titleLabel.text sizeInFont:self.titleLabel.font width:self.frame.size.width];
    CGFloat labelWidth  = MAX(self.titleLabel.frame.size.width, size.width) + 2;
    CGFloat labelHeight = MAX(self.titleLabel.frame.size.height, size.height) + 2;
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    switch (edgeInsetType) {
        case TWEdgeInsetType_Top: {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
            break;
        }
        case TWEdgeInsetType_Left: {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
            break;
        }
        case TWEdgeInsetType_Bottom: {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
            break;
        }
        case TWEdgeInsetType_Right:{
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
            break;
        }
        default:
            break;
    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = labelEdgeInsets;
    
    //NSLog(@"image: %@", NSStringFromUIEdgeInsets(self.imageEdgeInsets));
    //NSLog(@"title: w %f - %@", self.titleLabel.width, NSStringFromUIEdgeInsets(self.titleEdgeInsets));
}

@end
