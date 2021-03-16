//
//  NSString+twMD5.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

// 代码来源: http://blog.csdn.net/u011349387/article/details/47318679

NS_ASSUME_NONNULL_BEGIN

@interface NSString (twMD5)

//计算NSData 的MD5值
+(NSString*)getMD5WithData:(NSData * _Nullable)data;

//计算字符串的MD5值，
+(NSString*)getMD5WithString:(NSString * _Nullable)string;

//计算大文件的MD5值
+(NSString*)getFileMD5WithPath:(NSString * _Nullable)path;

- (NSString *)sha1;

// 下面两个的区别没有比较过.
- (NSString *)md5;
+ (NSString *)encryptByMd5:(NSString * _Nullable)str;

@end

NS_ASSUME_NONNULL_END
