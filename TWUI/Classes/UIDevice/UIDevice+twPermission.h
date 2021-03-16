//
//  UIDevice+twPermission.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^UIDevicePermissionBlock) (BOOL isFirst, BOOL isHavePermission);

@interface UIDevice (twPermission)

#pragma mark - 判断是否有硬件权限
+ (void)isHaveSysPermissionCameraBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPermissionAudioBlock:(UIDevicePermissionBlock)permissionBlock;

// 相册: 获取,判断,提醒权限等问题.
+ (void)isHaveSysPowerForAlbumBlock:(UIDevicePermissionBlock)permissionBlock;
+ (void)isHaveSysPowerForAlbumAlert:(BOOL)isShowAlert block:(UIDevicePermissionBlock)permissionBlock;

// 相册: 判断.
+ (BOOL)isHavePowerForAlbum NS_DEPRECATED_IOS(2_0, 7_0, "Use -isHaveSysPowerForAlbumAlert:block:");


@end

NS_ASSUME_NONNULL_END
