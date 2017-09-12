//
//  ViewController.m
//  Modal
//
//  Created by Mac on 2017/9/11.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "ViewController.h"
#import "XWModalView.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)modal:(id)sender
{
    XWModalView *modalView = [XWModalView modalView];
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    customView.backgroundColor = [UIColor orangeColor];
    modalView.customView = customView;
    [modalView show];
}

@end
