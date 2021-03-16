//
//  IToast_tanwang.m
//  TWTool_Example
//
//  Created by TW on 2021/3/12.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "IToast_tanwang.h"
#import <QuartzCore/QuartzCore.h>
#import "IToastTWTool.h"
#import <TWFoundation/NSString+twSize.h>


enum iToastDurationTanwang {
    iToastDurationTanwangLong = 10000,
    iToastDurationTanwangShort = 1000,
    iToastDurationTanwangNormal = 3000
}iToastDurationPopor;

#define CURRENT_TOAST_TAG 6984678

static const CGFloat kComponentPaddingW = 10;
static const CGFloat kComponentPaddingH = 5;

static iToastSettingsTanwang *sharedSettings = nil;

@interface IToast_tanwang(private)

- (IToast_tanwang *) settings;
- (CGRect)_toastFrameForImageSize:(CGSize)imageSize withLocation:(iToastImageLocationTanwang)location andTextSize:(CGSize)textSize;
- (CGRect)_frameForImage:(iToastTypeTanwang)type inToastFrame:(CGRect)toastFrame;

@end


@interface IToast_tanwang ()

@property (nonatomic, weak  ) IToastTWTool * itool;
@property (nonatomic, weak  ) UIView       * view;

@end


@implementation IToast_tanwang

- (id) initWithText:(NSString *) tex{
    if (self = [super init]) {
        self.itool = [IToastTWTool share];
        text       = [tex copy];
    }
    
    return self;
}

- (void) show{
    
    [self show:iToastTypeTanwangNone];
}

- (void) show:(iToastTypeTanwang) type {
    
    iToastSettingsTanwang *theSettings = [iToastSettingsTanwang getSharedSettings];
    
    if (!theSettings) {
        theSettings = [iToastSettingsTanwang getSharedSettings];
    }
    
    UIImage *image = [theSettings.images valueForKey:[NSString stringWithFormat:@"%i", type]];
    
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize textSize = [text sizeInFont:font width:280];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width, textSize.height + kComponentPaddingH)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = font;
    label.text = text;
    label.numberOfLines = 0;
    label.shadowColor = [UIColor darkGrayColor];
    label.shadowOffset = CGSizeMake(1, 1);
    label.textAlignment=NSTextAlignmentCenter;
    
    UIButton *showBT = [UIButton buttonWithType:UIButtonTypeCustom];
    if (image) {
        showBT.frame = [self _toastFrameForImageSize:image.size withLocation:[theSettings imageLocation] andTextSize:textSize];
        
        switch ([theSettings imageLocation]) {
            case iToastImageLocationTanwangLeft:
                [label setTextAlignment:NSTextAlignmentLeft];
                label.center = CGPointMake(image.size.width + kComponentPaddingW * 2
                                           + (showBT.frame.size.width - image.size.width - kComponentPaddingW * 2) / 2,
                                           showBT.frame.size.height / 2);
                break;
            case iToastImageLocationTanwangTop:
                [label setTextAlignment:NSTextAlignmentCenter];
                label.center = CGPointMake(showBT.frame.size.width / 2,
                                           (image.size.height + kComponentPaddingH * 2
                                            + (showBT.frame.size.height - image.size.height - kComponentPaddingH * 2) / 2));
                break;
            default:
                break;
        }
        
    } else {
        showBT.frame = CGRectMake(0, 0, textSize.width + kComponentPaddingW * 2, textSize.height + kComponentPaddingH * 2);
        label.center = CGPointMake(showBT.frame.size.width / 2, showBT.frame.size.height / 2);
    }
    //  wkq 隐藏
    //    CGRect lbfrm = label.frame;
    //    lbfrm.origin.x = ceil(lbfrm.origin.x);
    //    lbfrm.origin.y = ceil(lbfrm.origin.y);
    //    label.frame = lbfrm;
    [showBT addSubview:label];
    
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = [self _frameForImage:type inToastFrame:showBT.frame];
        [showBT addSubview:imageView];
    }
    
    showBT.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    showBT.layer.cornerRadius = 5;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    CGPoint point = CGPointZero;
    
    // Set correct orientation/location regarding device orientation
    UIInterfaceOrientation orientation = (UIInterfaceOrientation)[[UIApplication sharedApplication] statusBarOrientation];
    switch (orientation) {
        case UIDeviceOrientationPortrait:
        {
            if (theSettings.gravity == iToastGravityTanwangTop) {
                point = CGPointMake(window.frame.size.width / 2, 45);
            } else if (theSettings.gravity == iToastGravityTanwangBottom) {
                point = CGPointMake(window.frame.size.width / 2, window.frame.size.height - 45);
            } else if (theSettings.gravity == iToastGravityTanwangCenter) {
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x + offsetLeft, point.y + offsetTop + 0);
            break;
        }
        case UIDeviceOrientationPortraitUpsideDown:
        {
            //showBT.transform = CGAffineTransformMakeRotation(M_PI);
            
            float width = window.frame.size.width;
            float height = window.frame.size.height;
            
            if (theSettings.gravity == iToastGravityTanwangTop) {
                point = CGPointMake(width / 2, height - 45);
            } else if (theSettings.gravity == iToastGravityTanwangBottom) {
                point = CGPointMake(width / 2, 45);
            } else if (theSettings.gravity == iToastGravityTanwangCenter) {
                point = CGPointMake(width/2, height/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x - offsetLeft, point.y - offsetTop );
            break;
        }
        case UIDeviceOrientationLandscapeLeft:
        {
            //showBT.transform = CGAffineTransformMakeRotation(M_PI/2); //rotation in radians
            
            if (theSettings.gravity == iToastGravityTanwangTop) {
                point = CGPointMake(window.frame.size.width - 45, window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityTanwangBottom) {
                point = CGPointMake(45,window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityTanwangCenter) {
                //point = CGPointMake(window.frame.size.width/2, window.frame.size.height/2);
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x - offsetTop, point.y - offsetLeft );
            break;
        }
        case UIDeviceOrientationLandscapeRight:
        {
            //showBT.transform = CGAffineTransformMakeRotation(-M_PI/2);
            
            if (theSettings.gravity == iToastGravityTanwangTop) {
                point = CGPointMake(45, window.frame.size.height / 2);
            } else if (theSettings.gravity == iToastGravityTanwangBottom) {
                point = CGPointMake(window.frame.size.width - 45, window.frame.size.height/2);
            } else if (theSettings.gravity == iToastGravityTanwangCenter) {
                //point = CGPointMake(window.frame.size.width/2, window.frame.size.height/2);
#pragma mark - 王凯庆更改,假如键盘弹开了,那么在键盘上面.
                point = CGPointMake(window.frame.size.width/2, (window.frame.size.height - self.itool.keyboardH)/2);
            } else {
                // TODO : handle this case
                point = theSettings.postition;
            }
            
            point = CGPointMake(point.x + offsetTop, point.y + offsetLeft );
            break;
        }
        default:
            break;
    }
    
    showBT.center = point;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((float)theSettings.duration/1000 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self hideToast];
    });
    
    showBT.tag = CURRENT_TOAST_TAG;
    
    UIView *currentToast = [window viewWithTag:CURRENT_TOAST_TAG];
    if (currentToast != nil) {
        [currentToast removeFromSuperview];
    }
    
    showBT.alpha = 0;
    [window addSubview:showBT];
    //[window bringSubviewToFront:showBT];
    
    [UIView beginAnimations:nil context:nil];
    showBT.alpha = 1;
    [UIView commitAnimations];
    
    self.view = showBT;
    
    [showBT addTarget:self action:@selector(hideToast) forControlEvents:UIControlEventTouchDown];
}

- (CGRect)_toastFrameForImageSize:(CGSize)imageSize withLocation:(iToastImageLocationTanwang)location andTextSize:(CGSize)textSize {
    CGRect theRect = CGRectZero;
    switch (location) {
        case iToastImageLocationTanwangLeft:
            theRect = CGRectMake(0, 0,
                                 imageSize.width + textSize.width + kComponentPaddingW * 3,
                                 MAX(textSize.height, imageSize.height) + kComponentPaddingH * 2);
            break;
        case iToastImageLocationTanwangTop:
            theRect = CGRectMake(0, 0,
                                 MAX(textSize.width, imageSize.width) + kComponentPaddingW * 2,
                                 imageSize.height + textSize.height + kComponentPaddingH * 3);
            
        default:
            break;
    }
    return theRect;
}

- (CGRect)_frameForImage:(iToastTypeTanwang)type inToastFrame:(CGRect)toastFrame {
    iToastSettingsTanwang *theSettings = [iToastSettingsTanwang getSharedSettings];
    UIImage *image = [theSettings.images valueForKey:[NSString stringWithFormat:@"%i", type]];
    
    if (!image) return CGRectZero;
    
    CGRect imageFrame = CGRectZero;
    
    switch ([theSettings imageLocation]) {
        case iToastImageLocationTanwangLeft:
            imageFrame = CGRectMake(kComponentPaddingW, (toastFrame.size.height - image.size.height) / 2, image.size.width, image.size.height);
            break;
        case iToastImageLocationTanwangTop:
            imageFrame = CGRectMake((toastFrame.size.width - image.size.width) / 2, kComponentPaddingH, image.size.width, image.size.height);
            break;
            
        default:
            break;
    }
    
    return imageFrame;
    
}

- (void) hideToast {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.1 animations:^{
            weakSelf.view.alpha = 0;
        } completion:^(BOOL finished) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [IToast_tanwang destroyObject:self];
            });
        }];
    });
}

+ (void)destroyObject:(id)object {
    object = nil;
}

- (void) removeToast:(NSTimer*)theTimer{
    [self.view removeFromSuperview];
}


+ (IToast_tanwang *) makeText:(NSString *) _text{
    IToast_tanwang *toast = [[IToast_tanwang alloc] initWithText:_text];
    
    return toast;
}


- (IToast_tanwang *) setDuration:(NSInteger ) duration{
    [iToastSettingsTanwang getSharedSettings].duration = duration;
    return self;
}

- (IToast_tanwang *) setGravity:(iToastGravityTanwang) gravity
             offsetLeft:(NSInteger) left
              offsetTop:(NSInteger) top{
    [iToastSettingsTanwang getSharedSettings].gravity = gravity;
    offsetLeft = left;
    offsetTop = top;
    return self;
}

- (IToast_tanwang *) setGravity:(iToastGravityTanwang) gravity{
    [iToastSettingsTanwang getSharedSettings].gravity = gravity;
    return self;
}

- (IToast_tanwang *) setPostion:(CGPoint) _position{
    [iToastSettingsTanwang getSharedSettings].postition = CGPointMake(_position.x, _position.y);
    
    return self;
}

@end




@implementation iToastSettingsTanwang
@synthesize duration;
@synthesize gravity;
@synthesize postition;
@synthesize images;
@synthesize imageLocation;

- (void) setImage:(UIImage *) img withLocation:(iToastImageLocationTanwang)location forType:(iToastTypeTanwang) type {
    if (type == iToastTypeTanwangNone) {
        // This should not be used, internal use only (to force no image)
        return;
    }
    
    if (!images) {
        images = [[NSMutableDictionary alloc] initWithCapacity:4];
    }
    
    if (img) {
        NSString *key = [NSString stringWithFormat:@"%i", type];
        [images setValue:img forKey:key];
    }
    
    [self setImageLocation:location];
}

- (void)setImage:(UIImage *)img forType:(iToastTypeTanwang)type {
    [self setImage:img withLocation:iToastImageLocationTanwangLeft forType:type];
}


+ (iToastSettingsTanwang *) getSharedSettings{
    if (!sharedSettings) {
        sharedSettings = [iToastSettingsTanwang new];
        sharedSettings.gravity = iToastGravityTanwangCenter;
        sharedSettings.duration = iToastDurationTanwangShort;
    }
    
    return sharedSettings;
    
}

- (id) copyWithZone:(NSZone *)zone{
    iToastSettingsTanwang *copy = [iToastSettingsTanwang new];
    copy.gravity = self.gravity;
    copy.duration = self.duration;
    copy.postition = self.postition;
    
    NSArray *keys = [self.images allKeys];
    
    for (NSString *key in keys){
        [copy setImage:[images valueForKey:key] forType:[key intValue]];
    }
    
    [copy setImageLocation:imageLocation];
    
    return copy;
}

@end
