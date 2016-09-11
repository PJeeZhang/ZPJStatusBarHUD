//
//  ZPJStatusBarHUD.m
//  ZPJStatusBarHUDExample
//
//  Created by Mr.Right on 16/9/12.
//  Copyright (c) 2016年 Mr.Right. All rights reserved.
//

#import "ZPJStatusBarHUD.h"

#define ZPJMessageFont [UIFont systemFontOfSize:12]

/** 消息的停留时间 */
static CGFloat  ZPJMessageDuration = 1.5;
/** 消息显示\隐藏的动画时间 */
static CGFloat  ZPJAnimationDuration = 0.25;


@implementation ZPJStatusBarHUD




/** 全局的窗口 */
static UIWindow *window_;
/** 定时器 */
static NSTimer *timer_;

static UILabel *lable;



/**显示窗口*/
+ (void)showWindow
{
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    
    
    // 动画
    frame.origin.y = 0;
    [UIView animateWithDuration:ZPJAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    lable = [[UILabel alloc] init];
    lable.font = ZPJMessageFont;
    lable.frame = window_.bounds;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    [window_ addSubview:lable];
    
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:image];
    
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ZPJMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    imageV.center = CGPointMake(centerX, centerY);
    [window_ addSubview:imageV];
    
    // 定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZPJMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**显示普通信息*/
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}

/**显示成功信息*/
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZPJStatusBarHUD.bundle/success"]];
}

/**显示失败信息*/
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZPJStatusBarHUD.bundle/error"]];
}


/**显示正在处理的信息 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 显示窗口
    [self showWindow];
    
    // 添加文字
    lable = [[UILabel alloc] init];
    lable.font = ZPJMessageFont;
    lable.frame = window_.bounds;
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = msg;
    lable.textColor = [UIColor whiteColor];
    [window_ addSubview:lable];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ZPJMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loadingView];
}

/**隐藏*/
+ (void)hide
{
    [UIView animateWithDuration:ZPJAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y =  - frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}



/**设置背景颜色     默认为黑色*/
+ (void)setBackgroundColor:(UIColor *)backgroundColor
{
    
    window_.backgroundColor = backgroundColor;
    
    
    
}

/**设置文字颜色    默认为白色*/
+ (void)setTextColor:(UIColor *)textColor
{
    
    lable.textColor = textColor;
    
}

@end
