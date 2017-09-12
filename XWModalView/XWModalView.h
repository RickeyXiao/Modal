//
//  XWModalView.h
//  OnAir
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XWModalViewStyle) {
    XWModalViewStyleAlert = 0,
    XWModalViewStyleSheet
};

@class XWAction, XWModalAnimation, XWMainView;

@interface XWModalView : UIView

+ (instancetype)modalView;
+ (instancetype)modalViewWithStyle:(XWModalViewStyle)style;
+ (instancetype)modalViewWithStyle:(XWModalViewStyle)style
                         animation:(XWModalAnimation *)animation;

- (void)show;
- (void)hide;

- (void)addAction:(XWAction *)action;

@property (nonatomic, assign) CGSize actionButtonSize;
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong, readonly) XWMainView *mainView;
@property (nonatomic, assign, readonly) XWModalViewStyle style;
@property (nonatomic, strong, readonly) XWModalAnimation *animation;

@end
