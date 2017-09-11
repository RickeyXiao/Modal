//
//  XWModalView.m
//  OnAir
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWModalView.h"
#import "XWAction.h"

static const CGFloat kBaseSpacing = 8.0;

@interface XWModalView ()

@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, strong) NSMutableArray *actionButtons;
@property (nonatomic, strong) UIControl *backgroundControl;

@end

@implementation XWModalView

+ (instancetype)modalView
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _actionButtonSize = CGSizeMake(100.0, 30.0);
        self.bounds = CGRectMake(0, 0, 0, kBaseSpacing);
        _backgroundControl = [[UIControl alloc] init];
        _backgroundControl.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        [_backgroundControl addTarget:self action:@selector(backgroundTouched) forControlEvents:UIControlEventTouchUpInside];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5.0;
    }
    return self;
}

- (void)show
{
    [self setupUI];
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self.backgroundControl];
    [keyWindow addSubview:self];
    self.backgroundControl.frame = keyWindow.bounds;
    self.center = keyWindow.center;
}

- (void)hide
{
    [self removeFromSuperview];
    [self.backgroundControl removeFromSuperview];
}

- (void)addAction:(XWAction *)action
{
    [self.actions addObject:action];
    UIButton *actionButton = [self createButtonWithAction:action];
    actionButton.bounds = CGRectMake(0, 0, _actionButtonSize.width, _actionButtonSize.height);
    [self addNewView:actionButton];
    [self.actionButtons addObject:actionButton];
}

- (void)setCustomView:(UIView *)customView
{
    _customView = customView;
    [self addNewView:customView];
}

- (void)addNewView:(UIView *)newView
{
    [self addSubview:newView];
    
    //width
    CGFloat width = self.bounds.size.width;
    CGFloat newWidth = newView.bounds.size.width + kBaseSpacing * 2;
    width = width > newWidth ? width : newWidth;
    
    //height
    CGFloat height = self.bounds.size.height + newView.bounds.size.height + kBaseSpacing;
    
    //bounds
    self.bounds = CGRectMake(0, 0, width, height);
}

#pragma mark -

- (void)backgroundTouched
{
    [self hide];
}

- (void)setupUI
{
    if (self.customView) {
        self.customView.center = CGPointMake(self.bounds.size.width / 2, kBaseSpacing + self.customView.bounds.size.height / 2);
    }
    
    __block CGFloat lastY = CGRectGetMaxY(self.customView.frame) + kBaseSpacing;
    [_actionButtons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton *)obj;
        button.center = CGPointMake(self.bounds.size.width / 2, lastY + _actionButtonSize.height / 2);
        lastY = CGRectGetMaxY(button.frame) + kBaseSpacing;
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setupUI];
}

- (NSMutableArray *)actions
{
    if (!_actions) {
        _actions = [NSMutableArray array];
    }
    return _actions;
}

- (NSMutableArray *)actionButtons
{
    if (!_actionButtons) {
        _actionButtons = [NSMutableArray array];
    }
    return _actionButtons;
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
