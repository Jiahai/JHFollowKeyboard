JHFollowKeyboard
================
视图跟随键盘移动，防止被键盘遮挡

##1、如何使用？
```Objective-C
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //开启视图跟随键盘移动效果
    [self.view openFollowKeyboard];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //关闭视图跟随键盘移动效果
    [self.view closeFollowKeyboard];
}
```
注意事项：openFollowKeyboard与closeFollowKeyboard最好成对出现
##2、效果图
