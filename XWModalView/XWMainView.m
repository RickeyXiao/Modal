//
//  XWMainView.m
//  Modal
//
//  Created by Mac on 2017/9/12.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWMainView.h"

static const CGFloat kBaseSpacing = 8.0;

@interface XWMainView ()

@property (nonatomic, strong) NSMutableArray *actionButtons;
@property (nonatomic, strong) UIView *customView;

@end

@implementation XWMainView

+ (instancetype)mainView
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backgroundView = [[UIView alloc] init];
        _contentView = [[UIView alloc] init];
        _contentInset = UIEdgeInsetsZero;
        [self addSubview:_backgroundView];
        [self addSubview:_contentView];
        
        self.bounds = CGRectMake(0, 0, 0, kBaseSpacing + _contentInset.top + _contentInset.bottom);
    }
    return self;
}

- (void)addNewView:(UIView *)newView
{
    [self.contentView addSubview:newView];
    
    if ([newView isKindOfClass:[UIButton class]]) {
        [self.actionButtons addObject:newView];
    } else {
        self.customView = newView;
    }
    
    //width
    CGFloat width = self.bounds.size.width;
    CGFloat newWidth = newView.bounds.size.width + kBaseSpacing * 2 + _contentInset.left + _contentInset.right;
    width = width > newWidth ? width : newWidth;
    
    //height
    CGFloat height = self.bounds.size.height + newView.bounds.size.height + kBaseSpacing;
    
    //bounds
    self.bounds = CGRectMake(0, 0, width, height);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _backgroundView.frame = self.bounds;
    _contentView.frame = CGRectMake(_contentInset.left,
                                    _contentInset.top,
                                    self.bounds.size.width - _contentInset.left - _contentInset.right,
                                    self.bounds.size.height - _contentInset.top - _contentInset.bottom);
    
    if (self.customView) {
        self.customView.center = CGPointMake(_contentView.bounds.size.width / 2, kBaseSpacing + self.customView.bounds.size.height / 2);
    }
    
    __block CGFloat lastY = CGRectGetMaxY(self.customView.frame) + kBaseSpacing;
    [_actionButtons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = (UIButton *)obj;
        button.center = CGPointMake(_contentView.bounds.size.width / 2, lastY + button.bounds.size.height / 2);
        lastY = CGRectGetMaxY(button.frame) + kBaseSpacing;
    }];
}

- (NSMutableArray *)actionButtons
{
    if (!_actionButtons) {
        _actionButtons = [NSMutableArray array];
    }
    return _actionButtons;
}

@end
