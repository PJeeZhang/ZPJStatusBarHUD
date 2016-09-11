# ZPJStatusBarHUD
一个简简单单的状态栏显示器
## 显示成功
```objc
       [ZPJStatusHUD showSuccess:@"加载成功!"];
```
## 显示失败
```objc
       [ZPJStatusHUD showError:@"加载失败!"];
```
## 显示自定义文字
```objc
       [ZPJStatusHUD showMessage:@"没有什么事!!!!"];
```
## 显示loading
```objc
       [ZPJStatusHUD showLoading:@"正在加载中..."];
```
## 隐藏
```objc
       [ZPJStatusHUD hide];
```
## 其他方法
```objc

       // 设置背景颜色     默认为黑色
       + (void)setBackgroundColor:(UIColor *)backgroundColor;

       //设置文字颜色    默认为白色
       + (void)setTextColor:(UIColor *)textColor;
```