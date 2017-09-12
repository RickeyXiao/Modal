//
//  XWAction.h
//  OnAir
//
//  Created by Mac on 2017/9/5.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, XWActionStyle) {
    XWActionStyleDefault = 0,
    XWActionStyleCancel = 1,
    XWActionStyleDestructive = 2,
};

typedef void (^XWActionHandler)();

@interface XWAction : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, assign, readonly) XWActionStyle style;
@property (nonatomic, copy, readonly) XWActionHandler handler;

+ (instancetype)actionWithTitle:(NSString *)title
                          style:(XWActionStyle)style
                        handler:(XWActionHandler)handler;

- (instancetype)initWithTitle:(NSString *)title
                        style:(XWActionStyle)style
                      handler:(XWActionHandler)handler;

@end
