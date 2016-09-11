//
//  ZPJStatusBarHUD.h
//  ZPJStatusBarHUDExample
//
//  Created by Mr.Right on 16/9/12.
//  Copyright (c) 2016年 Mr.Right. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPJStatusBarHUD : UIView

/**
 * 显示普通信息
 * @param msg       文字
 * @param image     图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**显示普通信息*/
+ (void)showMessage:(NSString *)msg;

/**显示成功信息*/
+ (void)showSuccess:(NSString *)msg;

/**显示失败信息*/
+ (void)showError:(NSString *)msg;

/**显示正在处理的信息*/
+ (void)showLoading:(NSString *)msg;

/**隐藏 */
+ (void)hide;

/**设置背景颜色     默认为黑色*/
+ (void)setBackgroundColor:(UIColor *)backgroundColor;

/**设置文字颜色    默认为白色*/
+ (void)setTextColor:(UIColor *)textColor;




@end
