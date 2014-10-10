//
//  ViewController.m
//  JHFollowKeyboardExample
//
//  Created by Jiahai on 14-10-9.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "ViewController.h"
#import "UIView+JHFollowKeyboard.h"

@interface ViewController ()

@end

#define JHRGBA(r,g,b,a) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: JHRGBA(245, 86, 74, 1)};
    [self.navigationItem setTitle:@"JHFollowKeyboard"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
