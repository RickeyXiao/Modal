//
//  XWModalAnimation.h
//  Modal
//
//  Created by Mac on 2017/9/11.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XWModalAnimationType) {
    XWModalAnimationNone = 0,
    XWModalAnimationZoom = 1,
    XWModalAnimationFade = 2,
    XWModalAnimationTranslate = 3,
    XWModalAnimationDefault = XWModalAnimationZoom
};

@interface XWModalAnimation : NSObject

+ (instancetype)defaultModalAnimation;

- (instancetype)initWithType:(XWModalAnimationType)type
                    duration:(NSTimeInterval)duration;

- (instancetype)initWithType:(XWModalAnimationType)type
                    duration:(NSTimeInterval)duration
                     inPoint:(CGPoint)inPoint
                    outPoint:(CGPoint)outPoint;

@property (nonatomic, assign, readonly) XWModalAnimationType type;
@property (nonatomic, assign, readonly) NSTimeInterval duration;
// Refer to center of a view, translation
@property (nonatomic, assign, readonly) CGPoint inPoint;
@property (nonatomic, assign, readonly) CGPoint outPoint;

@end
