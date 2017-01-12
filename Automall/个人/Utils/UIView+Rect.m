//
//  UIView+Rect.m
//  Automall
//
//  Created by 刘思麟 on 2016/12/29.
//  Copyright © 2016年 SCW. All rights reserved.
//

#import "UIView+Rect.h"

@implementation UIView (Rect)

-(CGFloat)X
{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)X
{
    CGRect rect = self.frame;
    rect.origin.x = X;
    self.frame = rect;
}

-(CGFloat)Y
{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)Y
{
    CGRect rect = self.frame;
    rect.origin.y = Y;
    self.frame = rect;
}

-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint p = self.center;
    p.x = centerX;
    self.center = p;
}

-(CGFloat)centerY
{
    return self.center.y;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint p = self.center;
    p.y = centerY;
    self.center = p;
}

-(CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

-(CGFloat)width
{
    return self.frame.size.width;
}

-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

@end
