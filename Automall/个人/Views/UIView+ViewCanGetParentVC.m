//
//  UIView+ViewCanGetParentVC.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "UIView+ViewCanGetParentVC.h"

@implementation UIView (ViewCanGetParentVC)

-(UIViewController *)getParentVC
{
    UIResponder * responder = self;
    do {
        if ([responder nextResponder]) {
            responder = responder.nextResponder;
        }
    } while (![responder isKindOfClass:[UIViewController class]] || responder.nextResponder == nil);
    
    return (UIViewController*)responder;
}

@end
