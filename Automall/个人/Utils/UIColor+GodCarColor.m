//
//  UIColor+GodCarColor.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/9.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "UIColor+GodCarColor.h"

@implementation UIColor (GodCarColor)

+(UIColor*)colorWithRGBString:(NSString*)colorStr
{
    CGFloat r = [colorStr substringWithRange:NSMakeRange(1, 2)].floatValue;
    CGFloat g = [colorStr substringWithRange:NSMakeRange(3, 2)].floatValue;
    CGFloat b = [colorStr substringWithRange:NSMakeRange(5, 2)].floatValue;
    return [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}

@end
