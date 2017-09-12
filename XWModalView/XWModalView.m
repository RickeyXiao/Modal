//
//  XWModalView.m
//  OnAir
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWModalView.h"
#import "XWAction.h"
#import "XWMainView.h"
#import "XWModalAnimation.h"

@interface XWModalView ()

@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, strong) UIControl *backgroundControl;

@end

@implementation XWModalView

+ (instancetype)modalView
{
    return [self modalViewWithStyle:XWModalViewStyleAlert];
}

+ (instancetype)modalViewWithStyle:(XWModalViewStyle)style
{
    return [self modalViewWithStyle:style animation:[XWModalAnimation defaultModalAnimation]];
}

+ (instancetype)modalViewWithStyle:(XWModalViewStyle)style
                         animation:(XWModalAnimation *)animation
{
    return [[self alloc] initWithStyle:style animation:animation];
}

- (instancetype)initWithStyle:(XWModalViewStyle)style
                    animation:(XWModalAnimation *)animation
{
    self = [super init];
    if (self) {
        _style = style;
        _animation = animation;
        _actionButtonSize = CGSizeMake(100.0, 30.0);
        
        _backgroundControl = [[UIControl alloc] init];
        _backgroundControl.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [_backgroundControl addTarget:self action:@selector(backgroundTouched) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_backgroundControl];
        
        _mainView = [XWMainView mainView];
        _mainView.backgroundView.backgroundColor = [UIColor whiteColor];
        _mainView.layer.cornerRadius = 5.0;
        _mainView.clipsToBounds = YES;
        [self addSubview:_mainView];
    }
    return self;
}

- (void)show
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    if (!keyWindow) return;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(screenDidRotate:) name:UIApplicationWillChangeStatusBarOrientationNotification object:nil];
    
    [keyWindow addSubview:self];
    self.frame = keyWindow.bounds;
}

- (void)hide
{
    [self removeFromSuperview];
}

- (void)screenDidRotate:(NSNotification *)notification
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = keyWindow.bounds;
}

- (void)addAction:(XWAction *)action
{
    if (_style == XWModalViewStyleAlert && self.actions.count >= 2) {
        NSLog(@"Alert modal view should not contain more than two actions!");
        return;
    }
    
    [self.actions addObject:action];
    UIButton *actionButton = [self createButtonWithAction:action];
    actionButton.bounds = CGRectMake(0, 0, _actionButtonSize.width, _actionButtonSize.height);
    [_mainView addNewView:actionButton];
}

- (void)setCustomView:(UIView *)customView
{
    _customView = customView;
    [_mainView addNewView:customView];
}

#pragma mark -

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _backgroundControl.frame = self.bounds;
    _mainView.center = self.center;
}

- (void)backgroundTouched
{
    [self hide];
}

- (NSMutableArray *)actions
{
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}

- (UIButton *)createButtonWithAction:(XWAction *)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.cornerRadius = 5.0f;
    button.backgroundColor = [UIColor orangeColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:action.title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0];
    return button;
}

@end
