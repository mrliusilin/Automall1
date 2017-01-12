//
//  SortToolView.m
//  Automall
//
//  Created by 刘思麟 on 2017/1/11.
//  Copyright © 2017年 SCW. All rights reserved.
//

#import "SortToolView.h"
#import "UIView+Rect.h"
@implementation SortToolView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setStrArr:(NSMutableArray *)strArr
{
    _strArr = strArr;
}

//-(void)layoutSubviews
//{
//    [super layoutSubviews];
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, self.height - 1, self.width, 1)];
//    layer.path = path.CGPath;
//    layer.fillColor = HEXCOLOR(0xe6e6e6).CGColor;
//    [self.layer addSublayer:layer];
//}

@end
