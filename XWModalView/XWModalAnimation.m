//
//  XWModalAnimation.m
//  Modal
//
//  Created by Mac on 2017/9/11.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "XWModalAnimation.h"

@implementation XWModalAnimation

+ (instancetype)defaultModalAnimation
{
    return [[self alloc] initWithType:XWModalAnimationDefault duration:0.25f];
}

- (instancetype)initWithType:(XWModalAnimationType)type
                    duration:(NSTimeInterval)duration
{
    return [self initWithType:type duration:duration inPoint:CGPointZero outPoint:CGPointZero];
}

- (instancetype)initWithType:(XWModalAnimationType)type
                    duration:(NSTimeInterval)duration
                     inPoint:(CGPoint)inPoint
                    outPoint:(CGPoint)outPoint
{
    self = [super init];
    if (self) {
        _type = type;
        _duration = duration;
        _inPoint = inPoint;
        _outPoint = outPoint;
    }
    return self;
}

@end
