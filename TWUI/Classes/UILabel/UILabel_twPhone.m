//
//  UILabel_twPhone.m
//  TWTool_Example
//
//  Created by TW on 2021/3/11.
//  Copyright © 2021 tanwang11. All rights reserved.
//

#import "UILabel_twPhone.h"
#import <TWFoundation/NSString+twTool.h>


@implementation UILabel_twPhone

- (instancetype)init {
    if (self = [super init]) {
        if (!self.tapGR) {
            self.tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(phoneTapGRAction)];
            [self addGestureRecognizer:self.tapGR];
            self.userInteractionEnabled = YES;
        }
    }
    return self;
}

- (void)phoneTapGRAction {
    if (self.text.length > 0) {
        NSString * phone = [self.text replaceWithREG:@"-" newString:@""];
        // tel: 这个打完电话会留在电话APP
        // telprompt: 这个打完电话会返回自己APP
        phone = [NSString stringWithFormat:@"telprompt://%@", phone];
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phone]];
    }
}

@end
