//
//  NSObject+twSafeKVO.h
//  TWTool_Example
//
//  Created by TW on 2021/3/9.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 原始 @interface NSObject (WMSafeKVO)
@interface NSObject (twSafeKVO)

- (void)wm_addObserver:(NSObject * _Nullable)observer
            forKeyPath:(NSString * _Nullable)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void * _Nullable)context;

- (void)wm_removeObserver:(NSObject * _Nullable)observer
               forKeyPath:(NSString * _Nullable)keyPath
                  context:(void * _Nullable)context;

- (void)wm_removeObserver:(NSObject * _Nullable)observer
               forKeyPath:(NSString * _Nullable)keyPath;

@end

NS_ASSUME_NONNULL_END
