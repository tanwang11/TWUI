//
//  UIDevice+twSaveImage.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (twSaveImage)

// 保存image
+ (void)saveImageToPhotos:(UIImage *)image showAlert:(BOOL)isShowAlert;
// 保存data
+ (void)saveImageDataToPhotos:(NSData *)imageData showAlert:(BOOL)isShowAlert;

// 保存对应的文件,创建APP名字一致的文件夹
+ (void)saveImage:(UIImage *)image imageUrl:(NSURL *)imageUrl videoUrl:(NSURL *)videoUrl collectionName:(NSString *)collectionName showAlert:(BOOL)isShowAlert;

@end

NS_ASSUME_NONNULL_END
