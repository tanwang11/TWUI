//
//  UIImage+twSave.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UIImage+twSave.h"

@implementation UIImage (twSave)

+ (BOOL)saveImage:(UIImage *)image imagePath:(NSString *)imagePath {
    return [UIImagePNGRepresentation(image) writeToFile:imagePath atomically:YES];
}

@end
