//
//  UIView+JHFollowKeyboard.h
//  JHFollowKeyboardExample
//
//  Created by Jiahai on 14-10-9.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JHFollowKeyboard)

@property (nonatomic, assign)       CGRect  endKeyboardRect;
@property (nonatomic, assign)       CGFloat deltaY;                 //View移动的距离

/**
 *  开启视图跟随键盘移动效果
 */
- (void)openFollowKeyboard;
/**
 *  关闭视图跟随键盘移动效果，请一定记得关闭，否则页面不能释放
 */
- (void)closeFollowKeyboard;

@end
