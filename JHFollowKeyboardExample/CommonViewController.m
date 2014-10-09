//
//  CommonViewController.m
//  JHFollowKeyboardExample
//
//  Created by Jiahai on 14-10-9.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "CommonViewController.h"
#import "UIView+JHFollowKeyboard.h"

@interface CommonViewController ()

@end

@implementation CommonViewController


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //开启视图跟随键盘移动效果
    [self.view openFollowKeyboard];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //关闭视图跟随键盘移动效果，请一定记得关闭，否则页面不能释放
    [self.view closeFollowKeyboard];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
}

- (void)tapHandler
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
