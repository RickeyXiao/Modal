//
//  XWAction.m
//  OnAir
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWAction.h"

@implementation XWAction

+ (instancetype)actionWithTitle:(NSString *)title
                          style:(XWActionStyle)style
                        handler:(void (^)())handler
{
    return [[self alloc] initWithTitle:title style:style handler:handler];
}

- (instancetype)initWithTitle:(NSString *)title
                        style:(XWActionStyle)style
                      handler:(void (^)())handler
{
    self = [super init];
    if (self) {
        _title = title;
        _style = style;
    }
    return self;
}

@end
