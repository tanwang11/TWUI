//
//  IToast_tanwang.h
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum iToastGravityTanwang {
    iToastGravityTanwangTop = 1000001,
    iToastGravityTanwangBottom,
    iToastGravityTanwangCenter
}iToastGravityTanwang;

typedef enum iToastTypeTanwang {
    iToastTypeTanwangInfo = -100000,
    iToastTypeTanwangNotice,
    iToastTypeTanwangWarning,
    iToastTypeTanwangError,
    iToastTypeTanwangNone // For internal use only (to force no image)
}iToastTypeTanwang;

typedef enum iToastImageLocationTanwang {
    iToastImageLocationTanwangTop,
    iToastImageLocationTanwangLeft
} iToastImageLocationTanwang;

@class iToastSettingsTanwang;




@interface IToast_tanwang : NSObject  {
    NSInteger offsetLeft;
    NSInteger offsetTop;
    NSTimer   * timer;
    NSString  * text;
}

- (void) show;
- (void) show:(iToastTypeTanwang) type;
- (IToast_tanwang *) setDuration:(NSInteger ) duration;
- (IToast_tanwang *) setGravity:(iToastGravityTanwang) gravity
             offsetLeft:(NSInteger) left
              offsetTop:(NSInteger) top;
- (IToast_tanwang *) setGravity:(iToastGravityTanwang) gravity;
- (IToast_tanwang *) setPostion:(CGPoint) position;

+ (IToast_tanwang *) makeText:(NSString *) text;

- (id) initWithText:(NSString *) tex;

@end



@interface iToastSettingsTanwang : NSObject<NSCopying>{
    NSInteger duration;
    iToastGravityTanwang gravity;
    CGPoint postition;
    iToastTypeTanwang toastType;
    
    NSDictionary *images;
    
    BOOL positionIsSet;
}


@property(assign) NSInteger duration;
@property(assign) iToastGravityTanwang gravity;
@property(assign) CGPoint postition;
@property(readonly) NSDictionary *images;
@property(assign) iToastImageLocationTanwang imageLocation;


- (void) setImage:(UIImage *)img forType:(iToastTypeTanwang) type;
- (void) setImage:(UIImage *)img withLocation:(iToastImageLocationTanwang)location forType:(iToastTypeTanwang)type;
+ (iToastSettingsTanwang *) getSharedSettings;

@end

NS_ASSUME_NONNULL_END
