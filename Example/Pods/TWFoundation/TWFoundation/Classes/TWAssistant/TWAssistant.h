//
//  TWAssistant.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TWAssistant : NSObject

/*
 断点调试的时候,推荐使用chisel。或者配合Injection3使用以下方法。
 */
+ (void)NSLogEntity:(id _Nullable)theClassEntity;
+ (void)NSLogEntity:(id _Nullable)theClassEntity title:(NSString * _Nullable)title;

/**
 默认忽略__开头的参数.
 后来一般使用JsonModel来映射model,兼容性更高.
 */
+ (void)setFullEntity:(id _Nullable)theClassEntity withJson:(id _Nullable)theJsonObject;

/**
 以下接口不对参数正确性判断,需要自己审核dic.
 */
+ (void)setVC:(UIViewController * _Nullable)vc dic:(id _Nullable)dic;
+ (void)setEntity:(id _Nullable)entity dic:(id _Nullable)dic;

@end

NS_ASSUME_NONNULL_END
