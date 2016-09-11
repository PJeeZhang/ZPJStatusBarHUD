//
//  ViewController.m
//  ZPJStatusBarHUDExample
//
//  Created by Mr.Right on 16/9/12.
//  Copyright (c) 2016年 Mr.Right. All rights reserved.
//

#import "ViewController.h"
#import "ZPJStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController




- (IBAction)success:(id)sender {
    
    [ZPJStatusBarHUD showSuccess:@"加载成功!"];
    [ZPJStatusBarHUD setBackgroundColor:[UIColor greenColor]];
    [ZPJStatusBarHUD setTextColor:[UIColor redColor]];
    
    
}

- (IBAction)error:(id)sender {
    [ZPJStatusBarHUD showError:@"加载失败!"];
    [ZPJStatusBarHUD setTextColor:[UIColor redColor]];
}

- (IBAction)loading:(id)sender {
    [ZPJStatusBarHUD showLoading:@"正在加载中..."];
}
- (IBAction)message:(id)sender {
    [ZPJStatusBarHUD showMessage:@"没有什么事!!!!"];
    [ZPJStatusBarHUD setBackgroundColor:[UIColor greenColor]];
    [ZPJStatusBarHUD setTextColor:[UIColor redColor]];
    
    
}

- (IBAction)hide:(id)sender {
    [ZPJStatusBarHUD hide];
}

@end
