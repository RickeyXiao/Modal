//
//  XWMainView.h
//  Modal
//
//  Created by Mac on 2017/9/12.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWMainView : UIView

@property (nonatomic, strong, readonly) UIView *backgroundView;
@property (nonatomic, strong, readonly) UIView *contentView;

@property (nonatomic, assign) UIEdgeInsets contentInset;

+ (instancetype)mainView;

- (void)addNewView:(UIView *)newView;

@end
