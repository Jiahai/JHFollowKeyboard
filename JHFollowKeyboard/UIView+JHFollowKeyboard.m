//
//  UIView+JHFollowKeyboard.m
//  JHFollowKeyboardExample
//
//  Created by Jiahai on 14-10-9.
//  Copyright (c) 2014年 Jiahai. All rights reserved.
//

#import "UIView+JHFollowKeyboard.h"
#import "UIView+JHExtension.h"
#import "objc/runtime.h"

const CGFloat   defaultKeyboardAnimationDuration    = 0.25;
const CGFloat   aboveKeyboardHeight                 = 20;           //输入框在键盘上方的距离

#define screenHeight        [UIScreen mainScreen].bounds.size.height

@implementation UIView (JHFollowKeyboard)

static char JHFollowKeyboardEndKeyboardRect;
static char JHFollowKeyboardDeltaY;

- (void)setEndKeyboardRect:(CGRect)endKeyboardRect
{
    objc_setAssociatedObject(self, &JHFollowKeyboardEndKeyboardRect,[NSValue valueWithCGRect:endKeyboardRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGRect)endKeyboardRect
{
    return [objc_getAssociatedObject(self, &JHFollowKeyboardEndKeyboardRect) CGRectValue];
}

- (void)setDeltaY:(CGFloat)deltaY
{
    objc_setAssociatedObject(self, &JHFollowKeyboardDeltaY,[NSNumber numberWithFloat:deltaY], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)deltaY
{
    return [objc_getAssociatedObject(self, &JHFollowKeyboardDeltaY) floatValue];
}


- (void)openFollowKeyboard
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(firstResponderChanged) name:UITextFieldTextDidBeginEditingNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)closeFollowKeyboard
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)firstResponderChanged
{
    if(!CGRectEqualToRect(self.endKeyboardRect, CGRectZero))
    {
        NSNotification *notification = [NSNotification notificationWithName:@"firstResponderChanged" object:nil userInfo:@{UIKeyboardAnimationDurationUserInfoKey:@(defaultKeyboardAnimationDuration),UIKeyboardFrameEndUserInfoKey:[NSValue valueWithCGRect:self.endKeyboardRect]}];
        
        [self keyboardWillShow:notification];
    }
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    CGRect endKeyboardRect = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIView *firstResponder = self.jh_firstResponder;
    CGRect rect = [firstResponder.superview convertRect:firstResponder.frame toView:nil];//[self convertRect:firstResponder.frame fromView:firstResponder.superview];
    CGFloat deltaY = 0;
    
    if([self isKindOfClass:[UIScrollView class]])
    {
        deltaY = rect.origin.y - ((UIScrollView *)self).contentOffset.y + rect.size.height + aboveKeyboardHeight - endKeyboardRect.origin.y;
    }
    else
    {
        deltaY = rect.origin.y + rect.size.height + aboveKeyboardHeight - endKeyboardRect.origin.y;
    }

    BOOL moved = NO;
    NSLog(@"%.2f,%.2f,%.2f,%.2f,",self.jh_originY,screenHeight,self.deltaY,deltaY);
    CGFloat endOriginY = self.jh_originY + self.deltaY - deltaY;
    if(deltaY > 0)
    {
        moved = YES;
    }
    else
    {
        //键盘切换出现黑边的bug
        if(endOriginY < self.jh_originY + self.deltaY)
        {
            moved = YES;
        }
    }
    
    if(moved)
    {
        //解决设置aboveKeyboardHeight后出现黑边的bug
        if(endOriginY+self.jh_height<endKeyboardRect.origin.y)
        {
            CGFloat blackGap = endKeyboardRect.origin.y - (endOriginY + screenHeight);
            endOriginY += blackGap;
            deltaY -= blackGap;
        }
        //////////////////////////////////
        self.deltaY = deltaY;
        [UIView animateWithDuration:duration animations:^{
            self.frame = CGRectMake(0, endOriginY, self.jh_width, self.jh_height);
        }];
    }
    
    self.endKeyboardRect = endKeyboardRect;
    
}

- (void)keyboardWillHidden:(NSNotification *)notification
{
    NSDictionary *info = [notification userInfo];
    CGFloat duration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        self.frame = CGRectMake(0, self.jh_originY + self.deltaY, self.jh_width, self.jh_height);
    }];
    
    self.deltaY = 0;
    self.endKeyboardRect = CGRectZero;
}

@end
