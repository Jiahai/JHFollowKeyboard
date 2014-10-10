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
注意事项：1、openFollowKeyboard与closeFollowKeyboard最好成对出现
          2、const CGFloat   aboveKeyboardHeight = 20;           //可设置输入框在键盘上方的距离
##2、效果图
![](http://ww3.sinaimg.cn/mw690/8ac1a8bfgw1el666jy26wg20940g74qs.gif)
![](http://a.hiphotos.bdimg.com/album/s%3D680%3Bq%3D90/sign=2ce1b2942c2eb938e86d79fae559f408/eac4b74543a98226b7fa9a528982b9014a90eb88.jpg)
